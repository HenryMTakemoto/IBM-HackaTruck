//
//  ListaView.swift
//  TabViewNavigation
//
//  Created by Turma02-10 on 12/09/25.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    NavigationLink("Vegetti"){
                        RosaView()
                    }
                    NavigationLink("Coutinho"){
                        AzulView()
                    }
                    NavigationLink("LeoJardim"){
                        GrayView()
                    }.navigationTitle("Lista")
                }
            }
        }
    }
}

#Preview {
    ListaView()
}
