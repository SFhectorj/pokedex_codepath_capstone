//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Hector J. Baeza on 4/22/24.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

