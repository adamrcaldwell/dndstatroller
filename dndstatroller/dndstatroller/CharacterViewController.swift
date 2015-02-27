//
//  CharacterViewController.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 2/26/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UINavigationControllerDelegate {
    
    var selectedChar = Character(firstName: "", lastName: "", strength: 0, dexterity: 0, constitution: 0, intelligence: 0, wisdom: 0, charisma: 0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = selectedChar.returnFullName()
        self.characterViewName.text = selectedChar.returnFullName()
        self.characterViewSTR.text = "Strength: " + String(selectedChar.strength)
        self.characterViewDEX.text = "Dexterity: " + String(selectedChar.dexterity)
        self.characterViewCON.text = "Constitution: " + String(selectedChar.constitution)
        self.characterViewINT.text = "Intelligence: " + String(selectedChar.intelligence)
        self.characterViewWIS.text = "Wisdom: " + String(selectedChar.wisdom)
        self.characterViewCHA.text = "Charisma:" + String(selectedChar.charisma)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var characterViewName: UILabel!
    @IBOutlet weak var characterViewSTR: UILabel!
    @IBOutlet weak var characterViewDEX: UILabel!
    @IBOutlet weak var characterViewCON: UILabel!
    @IBOutlet weak var characterViewINT: UILabel!
    @IBOutlet weak var characterViewWIS: UILabel!
    @IBOutlet weak var characterViewCHA: UILabel!
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
