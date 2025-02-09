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
                Button("Prime") {
                    checkAnswer(isPrime: true)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Not Prime") {
                    checkAnswer(isPrime: false)
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

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
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        return true
    }

    func checkAnswer(isPrime: Bool) {
        timer?.invalidate()
        
        let correct = isPrime == isPrimeNumber(currentNumber)
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(isPrime == isPrimeNumber(currentNumber) ? .success : .error)
        
        if correct {
            correctAnswers += 1
            feedback = "✅"
        } else {
            wrongAnswers += 1
            feedback = "❌"
        }
        
        if (correctAnswers + wrongAnswers) % 10 == 0 {
            showResult = true
        } else {
            generateNewNumber()
            startTimer()
        }
        timer?.invalidate()
    }
    
    func generateNewNumber() {
        currentNumber = Int.random(in: 1...100)
        feedback = nil
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            wrongAnswers += 1
            feedback = "❌"
            if (correctAnswers + wrongAnswers) % 10 == 0 {
                showResult = true
            } else {
                generateNewNumber()
                startTimer()
            }
        }
    }
    
    func resetGame() {
        correctAnswers = 0
        wrongAnswers = 0
        generateNewNumber()
        startTimer()
    }
}

var correctSound: AVAudioPlayer?
var wrongSound: AVAudioPlayer?

func playSound(isCorrect: Bool) {
    let soundName = isCorrect ? "correct" : "wrong"
    if let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
        do {
            let player = try AVAudioPlayer(contentsOf: soundURL)
            player.play()
        } catch {
            print("Error loading sound file")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
