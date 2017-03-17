//
//  CustomCell.swift
//  diary
//
//  Created by Admin on 14.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {


    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
