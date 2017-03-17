//
//  DescViewController.swift
//  diary
//
//  Created by Admin on 14.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

class DescViewController: UIViewController {
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var textViewDesc: UITextView!
    
    var gameInfo = GameInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = gameInfo.name
        imageGame.image = gameInfo.image
        textViewDesc.text = gameInfo.desc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
