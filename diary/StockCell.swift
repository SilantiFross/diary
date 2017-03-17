//
//  StockCell.swift
//  diary
//
//  Created by Admin on 14.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
