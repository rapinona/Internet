//
//  GenreDataManager.swift
//  navigation
//
//  Created by Piñón Ayala Rodrigo  on 03/09/22.

import Foundation

class PersonajesDataManager{
    
    private var personajes = [Result]()
    
    func fetch(_ completion: @escaping () -> Void) {
        
        guard let laURL = URL(string: "https://rickandmortyapi.com/api/character")
        else {return}
        
        var request = URLRequest(url: laURL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
          // this is where the completion handler code goes
            if let error = error {
                print(error)
            }
            
            if let data = data {
                do{
                    let results = try JSONDecoder().decode(Personajes.self,from: data)
                    self.personajes = results.results
                    completion()
                }
                catch{
                    print("Error")
                }
            }
        }
        task.resume()
    }
    
    func personajeCount() -> Int{
        return personajes.count
    }
    
    func personajeAt(index: Int) -> Result{
        return personajes[index]
    }
    
    func personajeValue(index:Int) -> String{
        return personajes[index].name
    }
}
