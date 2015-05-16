//
//  CharacterHandler.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 5/16/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import Foundation

class CharacterHandler {
    var characterList = [Character]()
    func updateList(newChar: Character) {
        characterList.append(newChar)
    }
}

let characterHandler = CharacterHandler()