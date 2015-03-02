//
//  ViewController.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 2/26/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, updateListDelegate {

    // Variables
    
    var characterList = [Character]()
    
    // Delegation
    
    func updateList(value: Character) {
        characterList.append(value)
    }

    // Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        if let peopleFromArchive = self.loadFromArchive() as [Character]? {
            self.characterList = peopleFromArchive
        } else {
            self.saveToArchive()
        }
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")
        
        if hasLaunched == false {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // NSCoding persistence
    
    func loadFromArchive() -> [Character]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Character] {
            return peopleFromArchive
        }
        return nil
    }
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.characterList, toFile: documentsPath + "/archive")
    }
    
    // Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Protocol adherence
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BUILD_CELL", forIndexPath: indexPath) as ListTableViewCell
        var charToDisplay = self.characterList[indexPath.row]
        cell.characterLabel.text = charToDisplay.returnFullName()
        cell.characterLevelAndClassLabel.text = charToDisplay.returnLevelAndClass()
        return cell
    }
    
    // Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_CHARACTER" {
            let characterViewController = segue.destinationViewController as CharacterViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var charToPass = self.characterList[selectedIndexPath!.row]
            characterViewController.selectedChar = charToPass
        }
        
        if segue.identifier == "SHOW_CREATOR" {
            let creatorViewController = segue.destinationViewController as CreatorViewController
            
            creatorViewController.delegate = self
        }
    }


}
