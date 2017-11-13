//
//  ViewController.swift
//  FoodRater
//
//  Created by Mobile on 10/31/17.
//  Copyright © 2017 Mobile. All rights reserved.
// Init

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var foodInp: UITextField!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImg: UIImageView!
    let imgres = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgres.sourceType = .photoLibrary
        imgres.delegate = self
        foodInp.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        foodInp.resignFirstResponder()
        foodInp.text = " "
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let tempImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        foodImg.image = tempImg
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func foodInp(_ sender: AnyObject) {
        foodLabel.text = foodInp.text!
    }
    @IBAction func tapped(_ sender: AnyObject) {
        if(foodInp.isEditing){
            foodInp.resignFirstResponder()
            foodInp.text = "  "
        }
        self.present(imgres, animated: true, completion: nil)
    }

}

