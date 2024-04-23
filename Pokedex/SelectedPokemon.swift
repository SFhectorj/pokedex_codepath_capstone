//
//  SelectedPokemon.swift
//  Pokedex
//
//  Created by Hector J. Baeza on 4/22/24.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PkmnSprites
    var weight: Int
}

struct PkmnSprites: Codable {
    // Only using the front sprite
    var front_default: String?
}

class SelectionApi {
    // Return an array of the pokemon entry
    func getData(url: String, completion: @escaping (PkmnSprites) -> ()){
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            let pokeSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokeSprite.sprites)
            }
        }.resume()
    }
}
