//
//  ContentView.swift
//  Lab_Civan_Metin
//
//  Created by Civan Metin on 2025-02-07.
//

import SwiftUI


struct ContentView: View {
    @State private var currentNumber = Int.random(in: 1...100)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

