//
//  MonsterTableViewCell.swift
//  Darwin's Encyclopedia
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MonsterTableViewCell: UITableViewCell {
    static let reuseIdentifier = "MonsterCell"
    
    @IBOutlet weak var viewSpecies: UILabel!
    @IBOutlet weak var viewName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


