//
//  RetrievePokemon.swift
//  Pokedex
//
//  Created by Hector J. Baeza on 4/22/24.
//
// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation

struct Pokemon : Codable {
    var results: [PokemonEntry]
}

// Fields for the Pokémon data. This is based on the api
struct PokemonEntry: Codable,Identifiable {
    let id = UUID()
    var name: String
    var url: String
}

// Now this class will actually pull the data from the api
class PokeApi {
    // Return an array of the pokemon entry
    func getData(completion: @escaping ([PokemonEntry]) -> ()){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            // If data is detected then it will push it
            guard let data = data else {
                return
            }
            let pokeList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokeList.results)
            }
        // TIL this is required for the URLSession task to actually preform the task.
        }.resume()
    }
}
