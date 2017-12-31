//
//  AddDoseProgressView.swift
//  Potty
//
//  Created by Mark on 12/30/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation
import UIKit

class AddDoseProgressView: UIView {
    
    var circles = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(frame: CGRect, numberOfSteps: Int) {
        super.init(frame: frame)
        
        let lengthOfCircles = self.bounds.width - 20
        let increment = Double(lengthOfCircles) / Double(numberOfSteps)
        
        for i in 0 ... (numberOfSteps-1) {
            let circle = UIView(frame: CGRect (x: (10.0 + (Double(i) * increment)), y: 0.0, width: 50.0, height: 50.0))
            circle.layer.cornerRadius = 25.0
            if i == 0 {
                circle.backgroundColor = PottyColors.coreGreen
            } else {
                circle.backgroundColor = PottyColors.accentGray
            }
            circle.clipsToBounds = true
            circles.append(circle)
            self.addSubview(circle)
        }
        
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
