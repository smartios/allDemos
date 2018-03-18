//
//  basicTextandLabelTableViewCell.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class basicTextandLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var mobileNumimgView: UIImageView!
    @IBOutlet weak var textfieldimgView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mobNumBtn: UIButton!
    @IBOutlet weak var passShow: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var mobileNumViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var passShowConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setValues()
    }
    
    func setValues()
    {
        mobileNumimgView.backgroundColor = defaultImageColor()
        textfieldimgView.backgroundColor = defaultImageColor()
        textfield.textColor = defaultTextFieldColor()
        headerLabel.textColor = defaultHeaderLabelColor()
        mobNumBtn.titleLabel?.textColor = defaultTextFieldColor()
        passShow.titleLabel?.textColor = defaultThemeColor()
    }

    func showMobileBtnView()
    {
        mobileNumViewConstraint.constant = 35
    }
    
    func hideMobileBtnView()
    {
        mobileNumViewConstraint.constant = 0
    }
    
    func showPassBtn()
    {
        passShowConstraint.constant = 33
    }
    
    func hidePassBtn()
    {
        passShowConstraint.constant = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
