//
//  CreatePatternViewController.swift
//  Patterns
//
//  Created by VIJAY VENKATESH on 7/6/15.
//  Copyright (c) 2015 VIJAY VENKATESH. All rights reserved.
//

import UIKit
import CoreData


class CreatePatternViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameTextField2: UITextField!
    
    var frontPicture = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)
        
        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
        
    }
    
    func frontTapped () {
        println("front")
        self.frontPicture = true
        launchCamera()
    }
    
    func backTapped () {
        println("back")
        self.frontPicture = false
        launchCamera()
    }
        // Do any additional setup after loading the view.
    func launchCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        if self.frontPicture {
            self.frontImageView.image = image
            
        }
        else {
            self.backImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as! Pattern
        pattern.name = self.nameTextField.text
        println(pattern.name)
        pattern.frontImage = UIImageJPEGRepresentation(self.frontImageView.image, 1)
        pattern.backImage = UIImageJPEGRepresentation(self.backImageView.image, 1)
        
        context.save(nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
        

}
