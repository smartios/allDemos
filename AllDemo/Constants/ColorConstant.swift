//
//  ColorConstant.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit
import Foundation

let defaultImageColorHex = "#dedede"
let defaultHeaderLabelColorHex = "#acacac"
let defaultTextFieldColorHex = "#353535"
let defaultThemeColorHex = "#266eb7"


func defaultImageColor() -> UIColor
{
    return hexStringToUIColor(hex: defaultImageColorHex)
}

func defaultHeaderLabelColor() -> UIColor
{
    return hexStringToUIColor(hex: defaultHeaderLabelColorHex)
}

func defaultTextFieldColor() -> UIColor
{
    return hexStringToUIColor(hex: defaultTextFieldColorHex)
}

func defaultThemeColor() -> UIColor
{
    return hexStringToUIColor(hex: defaultThemeColorHex)
}


func hexStringToUIColor (hex:String) -> UIColor
{
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
