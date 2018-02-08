//
//  CustomView.swift
//  CustomViewFromXib
//
//  Created by Paul Solt on 12/10/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView, LoadViewFromNib {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    // Outlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("Pressed button!")
    }
    
    @IBInspectable var headerTitle: String = "$0.00" {
        didSet {
           label.text = headerTitle
        }
    }

    // THIS DEFAULT Doesn't apply to storyboard ... does it apply elsewhere?
    // The defaults are really keyed out the .xib file, not here ... not sure how to get
    // both without having major issues with IBInspectable not taking presedence over
    // a setting ...
//    @IBInspectable var buttonTitle: String = "2Press Me" {
//        didSet {
//            // Must call both of these for an @IBInspectable button title in Storyboard
//            button.titleLabel?.text = buttonTitle       // Update for Storyboard
//            button.setTitle(buttonTitle, for: .normal)  // Update for iOS app (resizes label for Storyboard)
//        }
//    }
    
    @IBInspectable var buttonTitle: String? {
        didSet {
            // Must call both of these for an @IBInspectable button title in Storyboard
            button.titleLabel?.text = buttonTitle       // Update for Storyboard
            button.setTitle(buttonTitle, for: .normal)  // Update for iOS app (resizes label for Storyboard)
        }
    }
    
    
//    @IBInspectable var buttonTitle: String? {
//        get {
//            return self.buttonTitle
//        }
//        set {
//            // Must call both of these for an @IBInspectable button title in Storyboard
//            button.titleLabel?.text = newValue       // Update for Storyboard
//            button.setTitle(newValue, for: .normal)  // Update for iOS app (resizes label for Storyboard)
//        }
//    }
    
    
    // Computed property
//    @IBInspectable var image: UIImage? {
//        get {
//            return imageView.image
//        }
//        set {
//            imageView.image = newValue
//        }
//    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        print("init?(coder)")

        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
//        self.view = loadViewFromNib() as! CustomView
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()

        print("prepareForInterfaceBuilder")
        // Setup any defaults for Storyboard (Interface Builder)
        
        // Setting any of these values will override the design time value
        // from Interface Builder ... I don't get the purpose of this ... at all ...
//        buttonTitle = "Default Button"
//        image = nil

        // Do I just want to set the control, not the property???? NOPE ...
        /// doing these changes also ruins any design time setting
//        button.titleLabel?.text = "Starting Title"
//        button.setTitle("Starting Title", for: .normal)
        
        
        // DONT call xibSetup() here, it's already been called, and you'll add
        // another view on top of it, so you won't see changes (2 views will be added)
    }
//    
    // Storyboard doesn't respect this value 
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 300, height: 120)
//    }
    
    func xibSetup() {
        view = loadViewFromNib(withName: "CustomView")
        
        // use bounds not frame or it'll be offset
        view.frame = bounds

        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    
    // If you add custom drawing, it'll be behind any view loaded from XIB
    
    
    }
    */
    
}
