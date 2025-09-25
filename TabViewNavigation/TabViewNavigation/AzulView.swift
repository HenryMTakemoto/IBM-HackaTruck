//
//  AzulView.swift
//  TabViewNavigation
//
//  Created by Turma02-10 on 12/09/25.
//

import SwiftUI

struct AzulView: View {
    var body: some View {
        ZStack{
            Color(.blue).ignoresSafeArea()
            Image("coutinho").resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 400)
            VStack{
                Spacer()
                Rectangle().fill(.white).frame(width: 400, height: 130).offset(y:120)

            }

        }
    }
}

#Preview {
    AzulView()
}
