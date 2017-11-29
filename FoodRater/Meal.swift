//
//  Meal.swift
//  FoodRater
//
//  Created by Mobile on 11/29/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var name: String!
    var rating: Int!
    var image: UIImage!
    init?(name: String, rating: Int, image: UIImage){
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.rating = rating
        self.image = image
    }
    
}
