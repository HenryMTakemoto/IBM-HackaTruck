//
//  ViewModel.swift
//  API
//
//  Created by Turma02-10 on 17/09/25.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var persona : [Frutas] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Frutas].self, from: data)
                
                DispatchQueue.main.async {
                    self?.persona = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

//#Preview {
//    ViewModel() as! any View
//}
