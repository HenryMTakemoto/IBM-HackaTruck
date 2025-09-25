//
//  ContentView.swift
//  Spot
//
//  Created by Turma02-10 on 15/09/25.
//

import SwiftUI

struct Musica{
    var name : String;
    var cantor : String;
    var capa : String;
    var id : Int;
}

struct ContentView: View {
    @State private var playlistName: String = "Playlist 1"
    @State private var owner : String = "Henry"
    var playlist = [Musica(name: "Lugar ao sol", cantor: "CBJR", capa: "https://i.scdn.co/image/ab67616d0000b2739ce3f2af269f08d61ac2ab9e", id: 1), Musica(name:"Exagerado", cantor: "Cazuza", capa: "https://www.tresselosrocinante.com/cdn/shop/files/cazuza-exagerado-vinil-lp-capa-album.jpg?v=1756735054", id: 2), Musica(name: "90210", cantor: "Travis Scott", capa: "https://i.scdn.co/image/ab67616d0000b2736cfd9a7353f98f5165ea6160", id: 3), Musica(name: "HOUSTONFORNICATION", cantor: "Travis Scott", capa: "https://m.media-amazon.com/images/I/81nFF-rXdRL.jpg", id: 4),Musica(name: "Butterfly Effect", cantor: "Travis Scott", capa: "https://m.media-amazon.com/images/I/81nFF-rXdRL.jpg", id: 5)]
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                ScrollView(.vertical){
                    Image("spotify").resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width:150)
                    Text(playlistName).foregroundStyle(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading).padding()
                    Text(owner).foregroundStyle(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading).padding()
                    ForEach(playlist, id: \.id){ e in
                        NavigationLink(destination: Tela2(musicName: e.name, author: e.cantor, photoAlbum: e.capa)){
                            VStack{
                                HStack{
                                    AsyncImage(url: URL(string: e.capa)){image in image.resizable().scaledToFit()
                                    }placeholder: {
                                        ProgressView()
                                    }.frame(width: 60)
                                    VStack{
                                        Text(e.name).foregroundStyle(.white)
                                        Text(e.cantor).foregroundStyle(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis").foregroundColor(.white)
                                        }
                                    }
                        }
                            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding()
                    Text("Sugerido").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    ScrollView(.horizontal){
                        HStack{
                            Image("spotify").resizable().frame(width:100, height: 100)
                            Image("spotify").resizable().frame(width:100, height: 100)
                            Image("spotify").resizable().frame(width:100, height: 100)
                            Image("spotify").resizable().frame(width:100, height: 100)
                            Image("spotify").resizable().frame(width:100, height: 100)
                            
                        }
                    }
                        }
                    }
                }
            }
        }

    


#Preview {
    ContentView()
}
