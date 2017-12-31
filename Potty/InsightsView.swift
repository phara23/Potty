//
//  InsightsView.swift
//  Potty
//
//  Created by Mark on 12/30/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation
import UIKit

class InsightsView: UIView {
    
    var consumedAmount: UILabel?
    var consumedAmountLabel: UILabel?
    
    var daysSmoked: UILabel?
    var daysSmokedLabel: UILabel?
    
    var amountSpent: UILabel?
    var amountSpentLabel: UILabel?
    
    var sinceWhen: UILabel?
    var sinceWhenLabel: UILabel?
    
    var amountByMgLabel: UILabel?
    var smokedAmount: UILabel?
    var smokedAmountLabel: UILabel?
    var vapedAmount: UILabel?
    var vapedAmountLabel: UILabel?
    var ateAmount: UILabel?
    var ateAmountLabel: UILabel?
    
    var favoriteStrainsByMgLabel: UILabel?
    var firstFavoriteAmount: UILabel?
    var firstFavoriteAmountLabel: UILabel?
    var secondFavoriteAmount: UILabel?
    var secondFavoriteAmountLabel: UILabel?
    var thirdFavoriteAmount: UILabel?
    var thirdFavoriteAmountLabel: UILabel?
    
    var insightsTitle: UIButton?
    
    var isMaximized = false
    
    init(frame: CGRect, inputConsumedAmount: Double, inputConsumedChangeLabel: String, inputSinceWhen: String, inputAmountSpent: String, inputSmokedAmount: String, inputVapedAmount: String, inputAteAmount:String) {
        super.init(frame: frame)
        self.backgroundColor = PottyColors.accentGray
        
        insightsTitle = UIButton(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 45.0))
        insightsTitle?.backgroundColor = PottyColors.coreGreen
        insightsTitle?.setTitle("^ Insights ^", for: .normal)
        insightsTitle?.setTitleColor(UIColor.white, for: .normal)
        insightsTitle?.addTarget(nil, action: #selector(ViewController.insightsPressed), for: .touchUpInside)
        self.addSubview(insightsTitle!)
            
            
        consumedAmountLabel = UILabel(frame: CGRect(x: self.bounds.width*0.09, y: 100, width: 165, height: 80))
        consumedAmountLabel?.text = "Total (mg)"
        consumedAmountLabel?.textAlignment = NSTextAlignment.center
        consumedAmountLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedAmountLabel!)
        
        consumedAmount = UILabel(frame: CGRect(x: self.bounds.width*0.13, y: 54, width: 140, height: 80))
        consumedAmount?.text = String(inputConsumedAmount)
        consumedAmount?.textAlignment = NSTextAlignment.center
        consumedAmount?.font = UIFont(name: "GillSans-Bold", size: 35.0)
        consumedAmount?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedAmount!)
        
        daysSmokedLabel = UILabel(frame: CGRect(x: self.bounds.width*0.59, y: 100, width: 165, height: 80))
        daysSmokedLabel?.text = "Days Smoked"
        daysSmokedLabel?.textAlignment = NSTextAlignment.center
        daysSmokedLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(daysSmokedLabel!)
        
        daysSmoked = UILabel(frame: CGRect(x: self.bounds.width*0.60, y: 54, width: 140, height: 80))
        daysSmoked?.text = inputConsumedChangeLabel
        daysSmoked?.textAlignment = NSTextAlignment.center
        daysSmoked?.font = UIFont(name: "GillSans-Bold", size: 48.0)
        daysSmoked?.backgroundColor = PottyColors.accentGray
        self.addSubview(daysSmoked!)
        
        
        amountSpentLabel = UILabel(frame: CGRect(x: self.bounds.width*0.09, y: 240, width: 165, height: 80))
        amountSpentLabel?.text = "Spent ($)"
        amountSpentLabel?.textAlignment = NSTextAlignment.center
        amountSpentLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(amountSpentLabel!)
        
        amountSpent = UILabel(frame: CGRect(x: self.bounds.width*0.13, y: 195, width: 140, height: 80))
        amountSpent?.text = inputAmountSpent
        amountSpent?.textAlignment = NSTextAlignment.center
        amountSpent?.font = UIFont(name: "GillSans-Bold", size: 40.0)
        amountSpent?.backgroundColor = PottyColors.accentGray
        self.addSubview(amountSpent!)
        
        sinceWhenLabel = UILabel(frame: CGRect(x: self.bounds.width*0.54, y: 240, width: 165, height: 80))
        sinceWhenLabel?.text = "Since"
        sinceWhenLabel?.textAlignment = NSTextAlignment.center
        sinceWhenLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(sinceWhenLabel!)
        
        sinceWhen = UILabel(frame: CGRect(x: self.bounds.width*0.60, y: 195, width: 140, height: 80))
        sinceWhen?.text = inputSinceWhen
        sinceWhen?.textAlignment = NSTextAlignment.center
        sinceWhen?.font = UIFont(name: "GillSans-Bold", size: 40.0)
        sinceWhen?.backgroundColor = PottyColors.accentGray
        self.addSubview(sinceWhen!)
        
        amountByMgLabel = UILabel(frame: CGRect(x: 0.0, y: 290, width: 170, height: 80.0))
        amountByMgLabel?.center.x = self.bounds.width/2
        amountByMgLabel?.text = "Amount (mg)"
        amountByMgLabel?.textAlignment = NSTextAlignment.center
        amountByMgLabel?.font = UIFont(name: "GillSans", size: 20.0)
        amountByMgLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(amountByMgLabel!)
        
        smokedAmount = UILabel(frame: CGRect(x: 0.0, y: 340, width: 150, height: 80.0))
        smokedAmount?.center.x = self.bounds.width/4
        smokedAmount?.text = inputSmokedAmount
        smokedAmount?.textAlignment = NSTextAlignment.center
        smokedAmount?.font = UIFont(name: "GillSans", size: 35.0)
        smokedAmount?.backgroundColor = PottyColors.accentGray
        self.addSubview(smokedAmount!)
        
        smokedAmountLabel = UILabel(frame: CGRect(x: 0.0, y: 395, width: 150, height: 80.0))
        smokedAmountLabel?.center.x = self.bounds.width/4
        smokedAmountLabel?.text = "Smoked"
        smokedAmountLabel?.textAlignment = NSTextAlignment.center
        smokedAmountLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(smokedAmountLabel!)
        
        vapedAmount = UILabel(frame: CGRect(x: 0.0, y: 340, width: 150, height: 80.0))
        vapedAmount?.center.x = self.bounds.width/2
        vapedAmount?.text = inputVapedAmount
        vapedAmount?.textAlignment = NSTextAlignment.center
        vapedAmount?.font = UIFont(name: "GillSans", size: 35.0)
        vapedAmount?.backgroundColor = PottyColors.accentGray
        self.addSubview(vapedAmount!)
        
        vapedAmountLabel = UILabel(frame: CGRect(x: 0.0, y: 395, width: 150, height: 80.0))
        vapedAmountLabel?.center.x = self.bounds.width/2
        vapedAmountLabel?.text = "Vaped"
        vapedAmountLabel?.textAlignment = NSTextAlignment.center
        vapedAmountLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(vapedAmountLabel!)
        
        ateAmount = UILabel(frame: CGRect(x: 0.0, y: 340, width: 150, height: 80.0))
        ateAmount?.center.x = self.bounds.width * 0.75
        ateAmount?.text = inputAteAmount
        ateAmount?.textAlignment = NSTextAlignment.center
        ateAmount?.font = UIFont(name: "GillSans", size: 35.0)
        ateAmount?.backgroundColor = PottyColors.accentGray
        self.addSubview(ateAmount!)
        
        ateAmountLabel = UILabel(frame: CGRect(x: 0.0, y: 395, width: 150, height: 80.0))
        ateAmountLabel?.center.x = self.bounds.width * 0.75
        ateAmountLabel?.text = "Ate"
        ateAmountLabel?.textAlignment = NSTextAlignment.center
        ateAmountLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(ateAmountLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addBorder(edges: UIRectEdge, color: UIColor = UIColor.white, thickness: CGFloat = 1.0) -> [UIView] {
        
        var borders = [UIView]()
        
        func border() -> UIView {
            let border = UIView(frame: CGRect.zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            return border
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            let top = border()
            addSubview(top)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[top(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["top": top]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[top]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["top": top]))
            borders.append(top)
        }
        
        if edges.contains(.left) || edges.contains(.all) {
            let left = border()
            addSubview(left)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[left(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["left": left]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[left]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["left": left]))
            borders.append(left)
        }
        
        if edges.contains(.right) || edges.contains(.all) {
            let right = border()
            addSubview(right)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:[right(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["right": right]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[right]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["right": right]))
            borders.append(right)
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            let bottom = border()
            addSubview(bottom)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:[bottom(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["bottom": bottom]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[bottom]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["bottom": bottom]))
            borders.append(bottom)
        }
        
        return borders
    }
    
}
