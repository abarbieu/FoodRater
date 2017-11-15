//
//  RatingControl.swift
//  FoodRater
//
//  Created by Mobile on 11/13/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var rating = 0 {
        didSet {
            layoutSubviews()
        }
    }
    var stars: [UIButton]
    let bW = 44
    let numSt = 5
    required init?(coder aCoder: NSCoder) {
        stars = []
        let fillSt = UIImage(named: "filledStar")
        let emptySt = UIImage(named: "emptyStar")
        super.init(coder: aCoder)
        for i in 0 ..< numSt {
            stars.append(UIButton())
            stars[i].tag = i+1
            stars[i].addTarget(nil, action: #selector(yeup), for: .touchDown)
            stars[i].setImage(fillSt, for: .selected)
            stars[i].setImage(emptySt, for: .normal)
            stars[i].setImage(fillSt, for: [.highlighted, .selected])
        }
    }
    @objc func yeup(sender: UIButton){
        rating = sender.tag
    }
    override func layoutSubviews() {
        for i in 0 ..< numSt {
            if(i<rating){
                stars[i].isSelected = true
            }else{
                stars[i].isSelected = false
            }
            stars[i].frame = CGRect(x: i*bW+numSt, y: 0, width: bW, height: bW)
            self.addSubview(stars[i])
        }
        
    }
}
