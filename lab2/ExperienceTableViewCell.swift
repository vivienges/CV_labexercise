//
//  ExperienceTableViewCell.swift
//  lab2
//
//  Created by Vivien Geschwind on 23.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var institutionImageView: UIImageView!
    @IBOutlet weak var institutionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
