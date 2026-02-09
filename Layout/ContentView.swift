//
//  ContentView.swift
//  Layout
//
//  Created by Mark Nair on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.2), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
    
                Button("Click me!") {
                    let messages = ["The force is with you", "Make me a sandwich because I like my PB&J toasty and on rye bread", "You're a Jedi now!", "I like turtles"]
                    
                    message = messages[messageNumber]
                    messageNumber += 1
                    
                    if messageNumber == messages.count {
                        messageNumber = 0
                    }
                    
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
