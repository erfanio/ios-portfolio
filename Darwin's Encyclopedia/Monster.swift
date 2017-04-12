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
    
    init(_ name: String, _ age: Int, _ species: String, _ attackPower: Int, _ health: Int) {
        self.name = name
        self.age = age
        self.species = species
        self.attackPower = attackPower
        self.health = health
    }

}
