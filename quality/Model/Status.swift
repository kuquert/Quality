//
//  Status.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import Gloss

struct Status: Decodable {
    let health:  Int
    let attack:  Int
    let defense: Int
    let spAttack: Int
    let spDefense: Int
    let speed:  Int
    
    init?(json: JSON) {
        guard case let (health as Int, attack as Int, defense as Int, spAttack as Int, spDefense as Int, speed as Int) = (json["health"], json["attack"], json["defense"], json["spAttack"], json["spDefense"], json["speed"])
            else{ return nil }
        
        self.health = health
        self.attack = attack
        self.defense = defense
        self.spAttack = spAttack
        self.spDefense = spDefense
        self.speed = speed
    }
    
}
