//
//  ViewController.swift
//  Pokedex
//
//  Created by Hector J. Baeza on 4/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        let pokemon = pokemonEntries[indexPath.row]
        cell.pokemonName.text = pokemon.name
        return cell
    }
    
    
    @IBOutlet weak var pokemonList: UITableView!
    var pokemonEntries: [PokemonEntry] = []
    let pokeApi = PokeApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonList.dataSource = self
        pokemonList.delegate = self
        
        // Fetch Pokémon data from the API
        pokeApi.getData { [weak self] entries in
            self?.pokemonEntries = entries
            DispatchQueue.main.async {
                self?.pokemonList.reloadData()
            }
        }
    }
}
