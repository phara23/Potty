//
//  MainMenuView.Swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation
import UIKit

class MainMenuView: UIView {
    
    var addUsage: UIButton?
    var viewSwitch: UISwitch?
    var addDoseView: AddDoseView?
    
    var graphIcon: UIImageView?
    var calendarIcon: UIImageView?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = PottyColors.accentGray
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        addUsage = UIButton(frame: CGRect(x: 2.0, y: 9.0, width: self.bounds.width*0.45, height: 40.0))
        addUsage?.backgroundColor = PottyColors.coreGreen
        addUsage?.setTitle("+ Dose(s)", for: .normal)
        addUsage?.setTitleColor(UIColor.white, for: .normal)
        addUsage?.addTarget(nil, action: #selector(ViewController.pressAddUseage), for: .touchUpInside)
        self.addSubview(addUsage!)
        
        
        addSwitchButton()
        
        var graph = UIImage(named:"graph_icon")
        var calendar = UIImage(named:"calendar_icon")
        
        graphIcon = UIImageView(image: graph)
        calendarIcon = UIImageView(image: calendar)
        
        calendarIcon?.center = CGPoint(x: self.bounds.width*0.61, y: self.bounds.height/2)
        graphIcon?.center = CGPoint(x: self.bounds.width*0.89, y: self.bounds.height/2)

        
        self.addSubview(graphIcon!)
        self.addSubview(calendarIcon!)
        
         self.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 1.0)
    }
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func addSwitchButton() {
        viewSwitch = UISwitch()
         viewSwitch?.center = CGPoint(x: self.bounds.width*0.75, y: self.bounds.height/2.0)
         viewSwitch?.setOn(false, animated: false)
         viewSwitch?.tintColor = UIColor.darkGray
         viewSwitch?.onTintColor = PottyColors.niceBlue
         viewSwitch?.thumbTintColor = PottyColors.coreGreen
         //viewSwitch?.backgroundColor = UIColor.yellow
         viewSwitch?.addTarget(nil, action: #selector(ViewController.switchChanged), for: UIControlEvents.valueChanged)
         self.addSubview(viewSwitch!)
    }
    
    
    func addDoseViewFunc() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        addDoseView = AddDoseView(frame: CGRect(x: 10.0, y: screenHeight, width: (screenWidth-10.0), height: screenHeight*0.7))
        self.addSubview(addDoseView!)
    }
    
    
}
