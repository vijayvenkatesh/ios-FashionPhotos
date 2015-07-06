//
//  PatternDetailViewController.swift
//  Patterns
//
//  Created by VIJAY VENKATESH on 7/6/15.
//  Copyright (c) 2015 VIJAY VENKATESH. All rights reserved.
//

import UIKit

class PatternDetailViewController: UIViewController {
    var pattern: Pattern? = nil
    var typedImage: UIImage? = nil
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.pattern!.name
        self.frontImageView.image = UIImage(data:self.pattern!.frontImage)
        self.backImageView.image = UIImage(data:self.pattern!.backImage)
        
        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)
        
        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
        
    }

    func frontTapped () {
        self.typedImage = self.frontImageView.image
        self.performSegueWithIdentifier("zoomSegue", sender: self)
    }
    
    func backTapped () {
        self.typedImage = self.backImageView.image
        self.performSegueWithIdentifier("zoomSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var zoomViewController = segue.destinationViewController as! ZoomViewController
        zoomViewController.image = self.typedImage!
    }

}
