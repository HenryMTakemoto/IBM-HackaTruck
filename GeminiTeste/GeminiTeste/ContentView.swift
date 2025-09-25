//
//  ContentView.swift
//  GeminiTeste
//
//  Created by Turma02-10 on 24/09/25.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    let model = GenerativeModel(name: "gemini-2.0-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "Hello, how i can help you?"
    
    func sendMessage() {
        aiResponse = ""
        
        Task {
            do {
                let response = try await model.generateContent(textInput)
                guard let text = response.text else {
                    textInput = "Sorry, I couldn't not process that. Try again"
                    return
                }
                
                textInput = ""
                aiResponse = text
            } catch {
                aiResponse = "Something went wrong!\n\(error.localizedDescription)"
            }
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle().fill(.green).ignoresSafeArea()
            
            VStack{
                Text("CHATBOT").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundStyle(.white)
                
                TextField("Escreva sua mensagem...", text: $textInput).background(.white).frame(width: 350).padding()
                
                Button("Enviar mensagem"){
                    sendMessage()
                }.padding()
                
                ScrollView{
                    Text(aiResponse).frame(maxWidth: .infinity, alignment: .leading).padding()
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
