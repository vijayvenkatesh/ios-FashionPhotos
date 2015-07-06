//
//  CreatePatternViewController.swift
//  Patterns
//
//  Created by VIJAY VENKATESH on 7/6/15.
//  Copyright (c) 2015 VIJAY VENKATESH. All rights reserved.
//

import UIKit
import CoreData


class CreatePatternViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameTextField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as! Pattern
        pattern.name = self.nameTextField2.text
        context.save(nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
        

}
