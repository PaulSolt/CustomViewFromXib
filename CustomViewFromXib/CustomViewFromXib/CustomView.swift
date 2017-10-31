//
//  CustomView.swift
//  CustomViewFromXib
//
//  Created by Paul Solt on 12/10/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    // Outlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("Pressed button!")
    }
    
    @IBInspectable var title: String? {
        get {
            return label.text
        }
        set(title) {
            label.text = title
        }
    }
    
    // NOTE: THIS DOESN"T UPDATE in storyboard
    @IBInspectable var buttonTitle: String? {
        get {
            return button.title(for: .normal)
        }
        set(title) {
            button.setTitle(title, for: .normal)
            button.sizeToFit()
            
//            button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
//            button.setNeedsLayout()
//            button.setNeedsDisplay()
//            button.setNeedsUpdateConstraints()
        }
    }


    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
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
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
//        self.view = loadViewFromNib() as! CustomView
    }
    
    override func prepareForInterfaceBuilder() {
        print("DOG")
//        xibSetup()
//        self.buttonTitle = "user setting"
        
        /// BUTTON elements are not initilized in the beginning?
        print("Button title: \(button.title(for: .normal))")
//        button.setTitle("BLAH", for: .normal)
//        button.setTitle("BLAH", for: .highlighted)
//        button.setTitle("BLAH", for: .disabled)
//        button.setTitle("BLAH", for: .focused)
//        button.setTitle("BLAH", for: .reserved)
//        xibSetup()
    }
    
    func xibSetup() {
        
        guard let view = loadViewFromNib() else {
            print("Error loading UI")
            let label1 = UILabel()
            label1.text = "ERROR!:"
            label1.font = UIFont.systemFont(ofSize: 20)
            label1.sizeToFit()
            label1.center = CGPoint(x: 100, y: 100)
            addSubview(label1)
            return
        }
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        return view
    }
    
}
