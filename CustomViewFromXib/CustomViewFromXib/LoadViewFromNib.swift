//
//  LoadViewFromNib.swift
//  CustomViewFromXib
//
//  Created by Matthew Miller on 06/12/2017.
//  Copyright © 2017 Paul Solt. All rights reserved.
//

import UIKit

protocol LoadViewFromNib {
    
    func loadViewFromNib(withName: String) -> UIView?
}

extension LoadViewFromNib {
    
    func loadViewFromNib(withName name: String) -> UIView? {
        let bundle = Bundle(for: type(of: self) as! AnyClass)
        let nib = UINib(nibName: name, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
