//
//  ViewController.swift
//  Nex3me
//
//  Created by Introtuce on 08/08/19.
//  Copyright © 2019 Introtuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameLabelText: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate=self;
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabelText.text=nameText.text
    }
    
    
    
    
  //MARK: Action
    
    @IBAction func imageSelection(_ sender: UITapGestureRecognizer) {
        //Hide keyboared
        nameText.resignFirstResponder()
        let imagepicket=UIImagePickerController();
        imagepicket.sourceType = .photoLibrary
        imagepicket.delegate=self
        present(imagepicket,animated: true, completion: nil)
        
    }
   
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else{
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        selectedImageView.image=pickImage
        dismiss(animated: true, completion: nil)
    }
    
    
}

