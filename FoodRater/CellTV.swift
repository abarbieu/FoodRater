//
//  CellTV.swift
//  FoodRater
//
//  Created by Mobile on 11/17/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import UIKit

class CellTV: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var rating: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
