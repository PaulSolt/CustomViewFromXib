//
//  ViewController.swift
//  CustomViewFromXib
//
//  Created by Paul Solt on 12/10/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let c = CustomView(frame: CGRect(x: 100, y: 400, width: 200, height: 80))
        c.buttonTitle = "New Title PRESS!"
        c.button.setTitle("BLAH", for: .normal)     // Devs really want access to modify original
        // IBInspectable is only useful for Storyboard ... it really isn't useful in apps
        // where we need to do more with the UI element ... all this extra work for a "design"
        // frival that doesn't even work well ...
        
        view.addSubview(c)
        
    }

}

