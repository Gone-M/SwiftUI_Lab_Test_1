//
//  ContentView.swift
//  Lab_Civan_Metin
//
//  Created by Civan Metin on 2025-02-07.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var currentNumber = Int.random(in: 1...100)
    @State private var feedback: String? = nil
    @State private var correctAnswers = 0
    @State private var wrongAnswers = 0
    @State private var showResult = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(currentNumber)")
                .font(.system(size: 50))
                .bold()
                .padding()
                .transition(.scale)
                .animation(.easeInOut(duration: 0.1), value: currentNumber)
            
            HStack {
                Button(action: { checkAnswer(isPrime: true) }) {
                    Text("Prime")
                        .padding()
                        .frame(width: 120)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { checkAnswer(isPrime: false) }) {
                    Text("Not Prime")
                        .padding()
                        .frame(width: 120)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            if let feedback = feedback {
                Text(feedback)
                    .font(.title)
                    .padding()
                    .background(feedback == "✅" ? Color.green.opacity(0.3) : Color.red.opacity(0.3))
                    .cornerRadius(8)
            }
        }
        .alert(isPresented: $showResult) {
            Alert(
                title: Text("Game Over"),
                message: Text("Correct Answers: \(correctAnswers)\nWrong Answers: \(wrongAnswers)\nTry Again!"),
                dismissButton: .default(Text("Restart"), action: resetGame)
            )
        }
        .onAppear(perform: startTimer)
    }
    
    func isPrimeNumber(_ number: Int) -> Bool {
        guard number > 1 else { return false }
        if number == 2 || number == 3 { return true }
        if number % 2 == 0 || number % 3 == 0 { return false }
        for i in stride(from: 5, through: Int(Double(number).squareRoot()), by: 2) {
            if number % i == 0 { return false }
        }
        return true
    }
    
    func checkAnswer(isPrime: Bool) {
        stopTimer()
        
        let correct = isPrime == isPrimeNumber(currentNumber)
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(correct ? .success : .error)
        
        if correct {
            correctAnswers += 1
            feedback = "✅"
        } else {
            wrongAnswers += 1
            feedback = "❌"
        }
        
        playSound(isCorrect: correct)

        if (correctAnswers + wrongAnswers) % 10 == 0 {
            showResult = true
        } else {
            generateNewNumber()
            startTimer()
        }
    }
    
    func generateNewNumber() {
        currentNumber = Int.random(in: 1...100)
        feedback = nil
    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            wrongAnswers += 1
            feedback = "❌"
            playSound(isCorrect: false)

            if (correctAnswers + wrongAnswers) % 10 == 0 {
                showResult = true
            } else {
                generateNewNumber()
                startTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetGame() {
        correctAnswers = 0
        wrongAnswers = 0
        generateNewNumber()
        startTimer()
    }
}


func playSound(isCorrect: Bool) {
    let soundName = isCorrect ? "correct" : "wrong"
    if let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
