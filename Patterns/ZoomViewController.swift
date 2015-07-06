//
//  ZoomViewController.swift
//  Patterns
//
//  Created by VIJAY VENKATESH on 7/6/15.
//  Copyright (c) 2015 VIJAY VENKATESH. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Roll
        
        //sets minimum and maximum zoom scales
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 50
        self.scrollView.delegate = self
        
        self.imageView.image = self.image!
        

    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
