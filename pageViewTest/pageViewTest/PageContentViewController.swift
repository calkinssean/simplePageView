//
//  PageContentViewController.swift
//  pageViewTest
//
//  Created by Sean Calkins on 11/15/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    var pageIndex = Int()
    var titleText = String()
    var imageFile = String()
    
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
        print(self.titleText)
        
        self.imageView.image = UIImage(named: self.imageFile)
        
        print(self.titleText)
        
        self.label.text = self.titleText
        
        print(self.titleText)
        
        
    }


}
