//
//  ContentView.swift
//  Synthesizing
//
//  Created by Turma02-10 on 23/09/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var text: String = ""
    
    @State var utterance = AVSpeechUtterance()
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .multilineTextAlignment(.center)
            
            Divider()
            
            Button {
                utterance = AVSpeechUtterance(string: text)
                utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                synthesizer.speak(utterance)
                
                utterance.rate = 0.8
                utterance.pitchMultiplier = 0.8
                utterance.postUtteranceDelay = 0.2
                utterance.volume = 0.8
            } label: {
                HStack{
                    Image(systemName: "microphone.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Synthesize")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
