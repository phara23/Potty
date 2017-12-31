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
    
    var consumedChange: UILabel?
    var consumedChangeLabel: UILabel?
    
    var insightsTitle: UILabel?
    
    init(frame: CGRect, inputConsumedAmount: Double, inputConsumedChangeLabel: String) {
        super.init(frame: frame)
        self.backgroundColor = PottyColors.accentGray
        
        insightsTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 45.0))
        insightsTitle?.textAlignment = NSTextAlignment.center
        insightsTitle?.text = "^ Insights ^"
        insightsTitle?.backgroundColor = PottyColors.coreGreen
        insightsTitle?.textColor = UIColor.white
        insightsTitle?.font = UIFont(name: "GillSans-Bold", size: 29.0)
        self.addBorder(edges:[.top], color: UIColor.black)
        self.addSubview(insightsTitle!)
            
            
        consumedAmountLabel = UILabel(frame: CGRect(x: self.bounds.width*0.09, y: 120, width: 150, height: 80))
        consumedAmountLabel?.text = "Total (mg)"
        consumedAmountLabel?.textAlignment = NSTextAlignment.center
        consumedAmountLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedAmountLabel!)
        
        consumedAmount = UILabel(frame: CGRect(x: self.bounds.width*0.13, y: 69, width: 140, height: 80))
        consumedAmount?.text = String(inputConsumedAmount)
        consumedAmount?.textAlignment = NSTextAlignment.center
        consumedAmount?.font = UIFont(name: "GillSans-Bold", size: 48.0)
        consumedAmount?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedAmount!)
        
        consumedChangeLabel = UILabel(frame: CGRect(x: self.bounds.width*0.59, y: 125, width: 165, height: 80))
        consumedChangeLabel?.text = "Days Smoked"
        consumedChangeLabel?.textAlignment = NSTextAlignment.center
        consumedChangeLabel?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedChangeLabel!)
        
        consumedChange = UILabel(frame: CGRect(x: self.bounds.width*0.60, y: 69, width: 140, height: 80))
        consumedChange?.text = inputConsumedChangeLabel
        consumedChange?.textAlignment = NSTextAlignment.center
        consumedChange?.font = UIFont(name: "GillSans-Bold", size: 48.0)
        consumedChange?.backgroundColor = PottyColors.accentGray
        self.addSubview(consumedChange!)
        
        
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
