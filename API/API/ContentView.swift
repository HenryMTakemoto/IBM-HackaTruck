//
//  ContentView.swift
//  API
//
//  Created by Turma02-10 on 17/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Rectangle().fill(.red).ignoresSafeArea()
                ScrollView{
                    ForEach(viewModel.persona, id: \.self){
                        entry in
                        ZStack{
                            Rectangle().fill(.gray).scaledToFit().frame(maxWidth: 250)
                            VStack{
                                Text("Fruit : " + entry.name!)
                                Text("Nutrition per 100g")
                                Text("Calories : " + String(entry.nutritions.calories) + "kcal")
                                Text("Carbohydrates: " + String(entry.nutritions.carbohydrates) + "g")
                                Text("Fat: " + String(entry.nutritions.fat)+"g")
                                Text("Protein: " + String(entry.nutritions.protein)+"g")
                                
                                
                                
                            }
                            
                            
                        }//.padding()
                    }.navigationTitle("Frutas").onAppear()
                    {
                        viewModel.fetch()
                        
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
