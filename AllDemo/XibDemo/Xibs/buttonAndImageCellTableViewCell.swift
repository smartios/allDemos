//
//  buttonAndImageCellTableViewCell.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class buttonAndImageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var upperButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var upperBtnConstraints: NSLayoutConstraint!
    @IBOutlet weak var mainBtnConstraints: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        upperButton.setTitleColor(defaultThemeColor(), for: .normal)
        upperButton.backgroundColor = UIColor.white
        mainButton.backgroundColor = defaultThemeColor()
        mainButton.setTitleColor(UIColor.white, for: .normal)
        mainButton.layer.cornerRadius = 19
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func showMainBtn()
    {
        mainBtnConstraints.constant = 35
    }
    
    func hideMainBtn()
    {
        mainBtnConstraints.constant = 0
    }
 
    func showUpperBtn()
    {
        upperBtnConstraints.constant = 30
    }
    
    func hideUpperBtn()
    {
        upperBtnConstraints.constant = 0
    }
}
