//
//  RosaView.swift
//  TabViewNavigation
//
//  Created by Turma02-10 on 12/09/25.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Color(.pink).ignoresSafeArea()
            Image("vegetti").resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 250)
            VStack{
                Spacer()
                Rectangle().fill(.white).frame(height: 130).offset(y:120)

            }

        }
    }
}

#Preview {
    RosaView()
}
