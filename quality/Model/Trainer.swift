//
//  Trainer.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import Gloss

struct Trainer: Decodable {
    
    let name: String
    let age: Int
    let photo: String
    let town: String
    let onHandPokemons: Array<Pokemon>?
    
    // MARK: - Deserialization
    init?(json: JSON) {
        guard case let (name as String, age as Int, photo as String, town as String, pokemons as [JSON]) = (json["name"], json["age"], json["photo"], json["town"], json["onHandPokemons"])
            else{ return nil }
        
        self.name = name
        self.age = age
        self.photo = photo
        self.town = town
        self.onHandPokemons = Array<Pokemon>()
        
        for pokemon in pokemons{
            if let poke = Pokemon(json: pokemon){
                self.onHandPokemons!.append(poke)
            }
        }
    }
}
