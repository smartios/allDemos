//
//  imageAndLabelTableViewCell.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class imageAndLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var otherImgView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headingLabel.textColor = UIColor.black
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
