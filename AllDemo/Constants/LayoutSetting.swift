//
//  LayoutSetting.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//
import UIKit
import Foundation

func settingNav(navView : UINavigationController)
{
    navView.navigationBar.barTintColor = UIColor.white
    //navView.navigationBar.tintColor = .white
    navView.navigationBar.isTranslucent = true;
    navView.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navView.navigationBar.shadowImage = UIImage()
}
