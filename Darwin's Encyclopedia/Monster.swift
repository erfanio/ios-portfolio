//
//  Monster.swift
//  Darwin's Encyclopedia
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class Monster: NSObject {
    
    var name: String
    var age: Int
    var species: String
    var attackPower: Int
    var health: Int
    
    init(_ monster: MonsterEntity) {
        self.name = monster.name!
        self.age = Int(monster.age)
        self.species = monster.species!
        self.attackPower = Int(monster.attackPower)
        self.health = Int(monster.health)
    }
    
    init(_ name: String, _ age: Int, _ species: String, _ attackPower: Int, _ health: Int) {
        self.name = name
        self.age = age
        self.species = species
        self.attackPower = attackPower
        self.health = health
    }
    
    func desc() -> String {
        return "Name: \(self.name)\nAge: \(self.age)\nSpecies: \(self.species)\nAttack Power: \(self.attackPower)\nHealth: \(self.health)"
    }

}
