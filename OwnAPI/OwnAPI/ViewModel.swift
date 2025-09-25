//
//  ViewModel.swift
//  OwnAPI
//
//  Created by Turma02-10 on 19/09/25.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var estadio : [Estadio] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/henrymaeda" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Estadio].self, from: data)
                
                DispatchQueue.main.async {
                    self?.estadio = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

