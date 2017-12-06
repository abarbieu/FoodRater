//
//  ViewController.swift
//  FoodRater
//
//  Created by Mobile on 10/31/17.
//  Copyright © 2017 Mobile. All rights reserved.
// Init

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var foodInp: UITextField!
    //@IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImg: UIImageView!
    let imgres = UIImagePickerController()
    var newMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgres.sourceType = .photoLibrary
        imgres.delegate = self
        foodInp.delegate = self
        updateSaveButtonState()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        foodInp.resignFirstResponder()
        foodInp.text = " "
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        save.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
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
        navigationItem.title = foodInp.text
    }
    @IBAction func tapped(_ sender: AnyObject) {
        if(foodInp.isEditing){
            foodInp.resignFirstResponder()
            foodInp.text = "  "
        }
        self.present(imgres, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let name = navigationItem.title ?? ""
        let photo = foodImg.image
        let rating = self.rating.rating
        newMeal = Meal(name: name, rating: rating, image: photo!)
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    private func updateSaveButtonState() {
        let text = foodInp.text ?? ""
        save.isEnabled = !text.isEmpty
    }

}

