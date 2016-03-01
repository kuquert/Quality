//
//  Skill.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import Gloss

struct Skill: Decodable{
    let name: String?
    let type: String?
    let damageCategory: String?
    let power: Int?
    let accuracy: Int?
    let powerPoint: Int?
    
    init?(json: JSON) {
        guard case let (name as String, type as String, damageCategory as String, power as Int, accuracy as Int, powerPoint as Int) = (json["name"], json["type"], json["damageCategory"], json["power"], json["accuracy"], json["powerPoint"])
            else{return nil}
        self.name = name
        self.type = type
        self.damageCategory = damageCategory
        self.power = power
        self.accuracy = accuracy
        self.powerPoint = powerPoint
    }
}