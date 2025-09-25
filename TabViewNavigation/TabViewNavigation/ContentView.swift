//
//  ContentView.swift
//  TabViewNavigation
//
//  Created by Turma02-10 on 12/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                TabView{
                    RosaView().tabItem{
                        Label("Vegetti", systemImage: "paintbrush.fill")
                    }
                    AzulView().tabItem{
                        Label("Coutinho", systemImage:  "paintbrush.pointed.fill")
                    }
                    GrayView().tabItem { Label("LeoJardim", image: "paintpallete.fill")
                    }
                    ListaView().tabItem{
                        Label("Lista", systemImage: "list.bullet")
                    }
                    
                }
                
        }
        }

    }
}

#Preview {
    ContentView()
}
