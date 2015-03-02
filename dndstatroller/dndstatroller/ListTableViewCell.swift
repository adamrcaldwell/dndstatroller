//
//  ListTableViewCell.swift
//  dndstatroller
//
//  Created by Adam Caldwell on 2/26/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    // Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Outlets
    
    @IBOutlet weak var characterLabel: UILabel!
    
    @IBOutlet weak var characterLevelAndClassLabel: UILabel!
    

}
