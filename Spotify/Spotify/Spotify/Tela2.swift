//
//  Tela2.swift
//  Spot
//
//  Created by Turma02-10 on 15/09/25.
//

import SwiftUI

struct Tela2: View {
    @State  var musicName : String = ""
    @State  var author : String = ""
    @State  var photoAlbum: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack{
                AsyncImage(url: URL(string: photoAlbum)){image in image.resizable().scaledToFit()
                }placeholder: {
                    ProgressView()
                }.frame(width: 150)
                Text(musicName).foregroundStyle(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(author).foregroundStyle(.white)
                HStack{
                    Image(systemName: "shuffle").resizable().foregroundColor(.white).frame(width: 30, height: 30).padding()
                    Image(systemName: "backward.end.fill").resizable().foregroundColor(.white).frame(width: 30, height: 30).padding()
                    Image(systemName: "play.fill").resizable().foregroundColor(.white).frame(width: 30, height: 30).padding()
                    Image(systemName: "forward.end.fill").resizable().foregroundColor(.white).frame(width: 30, height: 30).padding()
                    Image(systemName: "repeat").resizable().foregroundColor(.white).frame(width: 30, height: 30).padding()
                }
            }
                
        }
    }
}

#Preview {
    Tela2()
}
