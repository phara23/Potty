//
//  TitleView.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation
import UIKit

class TitleView: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        self.setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }


    func setup() {
        self.text = "POTTY"
        self.textColor = self.textColor
        self.font = self.font
        self.layer.display()
        self.backgroundColor = UIColor.white
        self.textAlignment = NSTextAlignment.center
        self.font = UIFont(name: "GillSans-Bold", size: 29.0)
        self.textColor = PottyColors.coreGreen
    }
    

}
