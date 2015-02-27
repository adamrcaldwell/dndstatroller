//
//  CreatorViewController.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 2/26/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class CreatorViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var delegate: updateListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create a New Character"
        
        strengthDisplay.text = "0"
        dexterityDisplay.text = "0"
        constitutionDisplay.text = "0"
        intelligenceDisplay.text = "0"
        wisdomDisplay.text = "0"
        charismaDisplay.text = "0"
        
        self.firstNameField.delegate = self
        self.lastNameField.delegate = self

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var strengthDisplay: UILabel!
    @IBOutlet weak var dexterityDisplay: UILabel!
    @IBOutlet weak var constitutionDisplay: UILabel!
    @IBOutlet weak var intelligenceDisplay: UILabel!
    @IBOutlet weak var wisdomDisplay: UILabel!
    @IBOutlet weak var charismaDisplay: UILabel!
    
    var newChar = Character(firstName: "", lastName: "", strength: 0, dexterity: 0, constitution: 0, intelligence: 0, wisdom: 0, charisma: 0)
    
    @IBAction func rollButtonPressed(sender: AnyObject){
        var thisCharStats = newChar.rollStats()
        newChar.strength = thisCharStats[0]
        newChar.dexterity = thisCharStats[1]
        newChar.constitution = thisCharStats[2]
        newChar.intelligence = thisCharStats[3]
        newChar.wisdom = thisCharStats[4]
        newChar.charisma = thisCharStats[5]
        self.strengthDisplay.text = String(newChar.strength)
        self.dexterityDisplay.text = String(newChar.dexterity)
        self.constitutionDisplay.text = String(newChar.constitution)
        self.intelligenceDisplay.text = String(newChar.intelligence)
        self.wisdomDisplay.text = String(newChar.wisdom)
        self.charismaDisplay.text = String(newChar.charisma)
        newChar.firstName = firstNameField.text
        newChar.lastName = lastNameField.text
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        delegate?.updateList(newChar)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SAVE_AND_SHOW" {
//            let listViewController = segue.destinationViewController as ListViewController
//            var charToPass = self.newChar
//            listViewController.characterList.append(charToPass)
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
