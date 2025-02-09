//
//  ContentView.swift
//  Lab_Civan_Metin
//
//  Created by Civan Metin on 2025-02-07.
//

import SwiftUI

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
            
            HStack {
                Button("Prime") {
                    checkAnswer(isPrime: true)
                }
                .buttonStyle(BorderedButtonStyle())

                Button("Not Prime") {
                    checkAnswer(isPrime: false)
                }
                .buttonStyle(BorderedButtonStyle())
            }
            
            if let feedback = feedback {
                Text(feedback)
                    .font(.title)
                    .foregroundColor(feedback == "✅" ? .green : .red)
            }
        }
        .alert(isPresented: $showResult) {
            Alert(
                title: Text("Results"),
                message: Text("Correct: \(correctAnswers)\nWrong: \(wrongAnswers)"),
                dismissButton: .default(Text("OK"), action: resetGame)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
