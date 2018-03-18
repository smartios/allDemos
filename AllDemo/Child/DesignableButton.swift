//
//  DesignableButton.swift
//  AddChildDemo
//
//  Created by Vaibhav Agarwal on 3/17/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {

    @IBInspectable var borderWidth:CGFloat = 5.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.brown{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
