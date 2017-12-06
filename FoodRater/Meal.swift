//
//  Meal.swift
//  FoodRater
//
//  Created by Mobile on 11/29/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
    
    
    var name: String!
    var rating: Int!
    var image: UIImage!
    
    static let dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archive = dir.appendingPathComponent("meals")
    
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
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropKey.name) as? String else {
            return nil
        }
        
        
        let imageT = aDecoder.decodeObject(forKey: PropKey.image) as? UIImage
        let image = imageT==nil ? UIImage(named: "defaultPhoto.png"):imageT
        
        
        let ratingT = aDecoder.decodeObject(forKey: PropKey.rating) as? Int
        let rating = ratingT==nil ? 0:ratingT
            
        self.init(name: name, rating: rating!, image: image!)
    
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropKey.name)
        aCoder.encode(rating, forKey: PropKey.rating)
        aCoder.encode(image, forKey: PropKey.image)
    }
    struct PropKey {
        static let name = "name"
        static let rating = "rating"
        static let image = "image"
    }
}
