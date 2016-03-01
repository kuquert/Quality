//
//  Pokemon.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import Gloss

struct Pokemon: Decodable{
    let number: Int
    let name: String
    let icon:  String
    let image:  String
    let level: Int
    let type1: String
    let type2: String?
    let status: Status
    let skills: Array<Skill>
    
    init?(json: JSON) {
        guard case let (number as Int,
            name as String,
            icon as  String,
            image as  String,
            level as Int,
            type1 as String,
            status as JSON,
            skills as [JSON])
            =  (json["number"],
                json["name"],
                json["icon"],
                json["image"],
                json["level"],
                json["type1"],
                json["status"],
                json["skills"])
            else{ return nil }
        
        self.number = number
        self.name = name
        self.icon = icon
        self.image = image
        self.level = level
        self.type1 = type1
        self.type2 = "type2" <~~ json
        self.status = Status(json: status)!
        var a = Array<Skill>()
        for skill in skills{
            a.append(Skill(json: skill)!)
        }
        self.skills = a
    }
}