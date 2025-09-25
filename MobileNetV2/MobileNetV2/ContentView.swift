//
//  ContentView.swift
//  MobileNetV2
//
//  Created by Turma02-10 on 23/09/25.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var currentIndex: Int = 0
    let photos = ["laranja", "blueberry", "morango", "macaco", "ovelha"]
    let model = MobileNetV2()
    @State private var classificationLabel: String = ""
    
    
    var body: some View {
        ZStack{
            Rectangle().fill(.mint).ignoresSafeArea()
            VStack {
                Image(photos[currentIndex]).resizable().frame(width: 250, height: 250)
                HStack{
                    Button("Back"){
                        if self.currentIndex >= self.photos.count{
                            self.currentIndex = self.currentIndex-1
                        } else{
                            self.currentIndex = 0
                        }
                    }.padding().foregroundColor(Color.white).background(Color.gray)
                    Button("Next"){
                        if self.currentIndex < self.photos.count - 1{
                            self.currentIndex = self.currentIndex+1
                        } else{
                            self.currentIndex = 0
                        }
                    }.padding().foregroundColor(Color.white).background(Color.gray)
                }
                Button("Classify"){
                    classifyImage()
                }.padding().foregroundColor(Color.white).background(Color.green)
                Text(classificationLabel).padding().font(.body)
                Spacer()
            }
        }
 
    }
    private func classifyImage(){
        let currentImageName = photos[currentIndex]
        
        guard let image = UIImage(named: currentImageName), let resizedImage = image.resized(to: CGSize(width: 224, height: 224)), let buffer = resizedImage.convertToBuffer()else {
            return
        }
        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            let results = output.classLabelProbs.sorted {
                $0.1 > $1.1
            }
            let result = results.map { (key,value) in
                return "\(key) = \(String(format: "%.2f", value * 100))%"}.joined(separator: "\n")
            self.classificationLabel = result
        }
    }
}


#Preview {
    ContentView()
}
