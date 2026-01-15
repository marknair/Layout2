//
//  ContentView.swift
//  Layout
//
//  Created by Mark Nair on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I know code!"
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Button("Click me!") {
                message = "Awesome!"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
