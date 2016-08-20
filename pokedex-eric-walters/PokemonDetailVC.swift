//
//  PokemonDetailVC.swift
//  pokedex-eric-walters
//
//  Created by Eric Walters on 8/19/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    var pokemon: Pokemon!
    
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var evolutionLabel: UILabel!
    
    @IBOutlet weak var currentEvoImage: UIImageView!
    
    
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImage.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done
            self.updateUI()
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
   
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        pokedexLabel.text = "\(pokemon.pokedexId)"
        weightLabel.text = pokemon.weight
        attackLabel.text = pokemon.attack
        
        
        
        if pokemon.nextEvolutionId == "" {
            evolutionLabel.text = "No Evolutions"
            nextEvoImage.hidden = true
            
        } else {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            evolutionLabel.text = str
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
