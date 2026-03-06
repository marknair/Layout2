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
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isSoundOn = true
    let numberOfImages = 9
    let numberOfSounds = 6
    
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
            
            HStack {
                Text("Sound On!")
                Toggle("", isOn: $isSoundOn)
                    .labelsHidden()
                    .onChange(of: isSoundOn) {
                        if audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                        
                    }
                
                Spacer()
                
                Button("Click me!") {
                    let messages = ["The force is with you",
                                    "Make me a sandwich",
                                    "You're a Jedi now!",
                                    "I like turtles",
                                    "It's time for a bike ride."]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperbound: messages.count - 1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperbound: numberOfImages - 1)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperbound: numberOfSounds - 1)
                    
                    if isSoundOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
            }
        }
        .padding()
    }
    
    // MARK: FUNCTIONS
    
    func nonRepeatingRandom(lastNumber: Int, upperbound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperbound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 I cannot read the file called \(soundName).")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🙈 ERROR: \(error.localizedDescription)!")
        }
    }
}

#Preview {
    ContentView()
}
