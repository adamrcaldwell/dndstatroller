//
//  Character.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 2/26/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit
import Foundation

class Character: NSObject, NSCoding {
    
    var firstName: String
    var lastName: String
    var strength: Int
    var dexterity: Int
    var constitution: Int
    var intelligence: Int
    var wisdom: Int
    var charisma: Int
    var characterClass: String
    var level: Int
    var hitPoints: Int
    
    init(firstName : String, lastName : String, strength : Int, dexterity: Int, constitution : Int, intelligence : Int, wisdom : Int, charisma : Int, characterClass: String, level: Int, hitPoints: Int) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.strength = strength
        self.dexterity = dexterity
        self.constitution = constitution
        self.intelligence = intelligence
        self.wisdom = wisdom
        self.charisma = charisma
        self.characterClass = characterClass
        self.level = level
        self.hitPoints = hitPoints
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        self.strength = aDecoder.decodeObjectForKey("strength") as Int
        self.dexterity = aDecoder.decodeObjectForKey("dexterity") as Int
        self.constitution = aDecoder.decodeObjectForKey("constitution") as Int
        self.intelligence = aDecoder.decodeObjectForKey("intelligence") as Int
        self.wisdom = aDecoder.decodeObjectForKey("wisdom") as Int
        self.charisma = aDecoder.decodeObjectForKey("charisma") as Int
        self.characterClass = aDecoder.decodeObjectForKey("characterClass") as String
        self.level = aDecoder.decodeObjectForKey("level") as Int
        self.hitPoints = aDecoder.decodeObjectForKey("hitPoints") as Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.strength, forKey: "strength")
        aCoder.encodeObject(self.dexterity, forKey: "dexterity")
        aCoder.encodeObject(self.constitution, forKey: "constitution")
        aCoder.encodeObject(self.intelligence, forKey: "intelligence")
        aCoder.encodeObject(self.wisdom, forKey: "wisdom")
        aCoder.encodeObject(self.charisma, forKey: "charisma")
        aCoder.encodeObject(self.characterClass, forKey: "characterClass")
        aCoder.encodeObject(self.level, forKey: "level")
        aCoder.encodeObject(self.hitPoints, forKey: "hitPoints")
    }
    
    func returnFullName () -> String {
        var fullName : String = self.firstName + " " + self.lastName
        return fullName
    }
    
    func returnLevelAndClass () -> String {
        var levelAndClass : String = "Level " + String(self.level) + " " + self.characterClass
        return levelAndClass
    }
    
    func randomInt(min:Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func rollStats () -> Array<Int> {
        var stats = [Int]()
        
        let strengthRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(strengthRoll)
        
        let dexterityRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(dexterityRoll)
        
        let constitutionRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(constitutionRoll)
        
        let intelligenceRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(intelligenceRoll)
        
        let wisdomRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(wisdomRoll)
        
        let charismaRoll = randomInt(1,max:6) + randomInt(1,max:6) + randomInt(1,max:6)
        stats.append(charismaRoll)
        
        return stats
        
    }
    
    func rollHitPoints (selectedClass: String) -> Int {
        var hitPoints : Int
        switch selectedClass {
            case "Fighter":
                hitPoints = randomInt(1, max: 10)
            case "Barbarian":
                hitPoints = randomInt(1, max: 12)
            case "Paladin":
                hitPoints = randomInt(1, max: 10)
            case "Cleric":
                hitPoints = randomInt(1, max: 8)
            case "Favored Soul":
                hitPoints = randomInt(1, max: 8)
            case "Druid":
                hitPoints = randomInt(1, max: 8)
            case "Wizard":
                hitPoints = randomInt(1, max: 4)
            case "Sorcerer":
                hitPoints = randomInt(1, max: 4)
            case "Warlock":
                hitPoints = randomInt(1, max: 6)
            case "Bard":
                hitPoints = randomInt(1, max: 6)
            case "Rogue":
                hitPoints = randomInt(1, max: 6)
            case "Ranger":
                hitPoints = randomInt(1, max: 8)
            case "Monk":
                hitPoints = randomInt(1, max: 8)
        default:
            hitPoints = 0
        }
        return hitPoints
    }
        
}