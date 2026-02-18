//
//  ContentView.swift
//  Layout
//
//  Created by Mark Nair on 1/15/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 9
    
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
                let messages = ["The force is with you",
                                "Make me a sandwich",
                                "You're a Jedi now!",
                                "I like turtles",
                                "It's time for a bike ride."]
                
                var messageNumber = Int.random(in: 0...messages.count - 1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count - 1)
                }
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 0...numberOfImages)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...numberOfImages)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                //MARK: - Retrieve the audio here -
                
                let soundName = "sound0"
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 I cannot read the file called \(soundName).")
                    return
                }
                
                //MARK: - Initalize the audio player and play the audio -
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("🙈 ERROR: \(error.localizedDescription)!")
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
