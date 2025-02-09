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

    var body: some View {
        VStack(spacing: 20) {
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
    }
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
    let correct = isPrime == isPrimeNumber(currentNumber)
    
    if correct {
        correctAnswers += 1
    } else {
        wrongAnswers += 1
    }
}


#Preview {
    ContentView()
}

