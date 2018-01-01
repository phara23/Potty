//
//  AddDoseView.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation

class AddDoseView: UIView {
    
    var dateLabel: UILabel?
    var datePicker: UIDatePicker?
    var addPhotosButton: UIButton?
    
    var timeLabel: UILabel?
    var timePicker: UIDatePicker?
    
    var strainsLabel: UILabel?
    var strainsTextField: UITextField?
    
    var gramsLabel: UILabel?
    var gramsTextField: UITextField?
    var flowerGramsSelectButton: UIButton?
    var thcMGramsSelectButton: UIButton?
    
    var intakeLabel: UILabel?
    var smokedButton: UIButton?
    var edibleButton: UIButton?
    var vapedButton: UIButton?
    
    var exitButton: UIButton?
    var saveButton: UIButton?
    
    var currentPage: Int?
    
    var addDoseProgressView: AddDoseProgressView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = PottyColors.accentGray
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        
        addDoseProgressView = AddDoseProgressView(frame: CGRect(x: 0.0, y: self.bounds.height*0.75, width: self.bounds.width, height: 80), numberOfSteps: 5)
        self.addSubview(addDoseProgressView!)
        
        exitButton = UIButton(frame: CGRect(x: 0.0, y: self.bounds.height*0.90, width: self.bounds.width*0.5, height: self.bounds.height*0.10))
        exitButton?.backgroundColor = UIColor(red: 128.0/255.0, green: 187.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        exitButton?.setTitle("Back", for: .normal)
        exitButton?.setTitleColor(UIColor.white, for: .normal)
        exitButton?.addTarget(nil, action: #selector(ViewController.pressBack), for: .touchUpInside)
        self.addSubview(exitButton!)
        
        saveButton = UIButton(frame: CGRect(x: self.bounds.width*0.5, y: self.bounds.height*0.90, width: self.bounds.width*0.5, height: self.bounds.height*0.10))
        saveButton?.backgroundColor = UIColor(red: 39.0/255.0, green: 216.0/255.0, blue: 59.0/255.0, alpha: 1.0)
        saveButton?.setTitle("Next", for: .normal)
        saveButton?.setTitleColor(UIColor.white, for: .normal)
        saveButton?.addTarget(nil, action: #selector(ViewController.pressNext), for: .touchUpInside)
        self.addSubview(saveButton!)
        
        
        
        dateLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 175, height: 45))
        dateLabel?.text = "Date you smoked"
        dateLabel?.font = timeLabel?.font
        dateLabel?.layer.display()
        dateLabel?.textAlignment = NSTextAlignment.center
        dateLabel?.font = UIFont(name: "GillSans", size: 22.0)
        dateLabel?.textColor = UIColor.white
        dateLabel?.center.x = self.bounds.width/2
        self.addSubview(dateLabel!)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = UIDatePickerMode.date
        datePicker?.frame = CGRect(x: 20.0, y: 120, width: 300.0, height: 40.0)
        datePicker?.backgroundColor = UIColor.white
        datePicker?.center.x = self.bounds.width/2
        self.addSubview(datePicker!)
        datePicker?.addTarget(nil, action: #selector(ViewController.startDateDiveChanged), for: UIControlEvents.valueChanged)
        
        addPhotosButton = UIButton(frame: CGRect(x: 20.0, y: 220.0, width: 200, height: 65.0))
        addPhotosButton?.backgroundColor = PottyColors.coreGreen
        addPhotosButton?.setTitle("Add Photos", for: UIControlState.normal)
        addPhotosButton?.addTarget(nil, action: #selector(ViewController.addPhotosPressed), for: .touchUpInside)
        self.addSubview(addPhotosButton!)
        
        
        
        timeLabel = UILabel(frame: CGRect(x: self.bounds.width*1.5, y: 70, width: 175, height: 45))
        timeLabel?.text = "Time you smoked"
        timeLabel?.textColor = timeLabel?.textColor
        timeLabel?.font = timeLabel?.font
        timeLabel?.layer.display()
        timeLabel?.textAlignment = NSTextAlignment.center
        timeLabel?.font = UIFont(name: "GillSans", size: 22.0)
        timeLabel?.textColor = UIColor.white
        self.addSubview(timeLabel!)
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = UIDatePickerMode.time
        timePicker?.frame = CGRect(x: self.bounds.width*1.5, y: 120.0, width: 300.0, height: 40.0)
        timePicker?.backgroundColor = UIColor.white
        self.addSubview(timePicker!)
        timePicker?.addTarget(nil, action: #selector(ViewController.startTimeDiveChanged), for: UIControlEvents.valueChanged)
        
        strainsLabel = UILabel(frame: CGRect(x: self.bounds.width*1.5, y: 70, width: 170, height: 45))
        strainsLabel?.text = "Strains you had"
        strainsLabel?.textColor = timeLabel?.textColor
        strainsLabel?.font = timeLabel?.font
        strainsLabel?.layer.display()
        strainsLabel?.textAlignment = NSTextAlignment.center
        strainsLabel?.font = UIFont(name: "GillSans", size: 22.0)
        strainsLabel?.textColor = UIColor.white
        self.addSubview(strainsLabel!)
        
        strainsTextField =  UITextField(frame: CGRect(x: self.bounds.width*1.5, y: 120, width: 300, height: 40))
        strainsTextField?.placeholder = "Blue dream, OG Kush"
        strainsTextField?.font = UIFont.systemFont(ofSize: 15)
        strainsTextField?.borderStyle = UITextBorderStyle.roundedRect
        strainsTextField?.autocorrectionType = UITextAutocorrectionType.no
        strainsTextField?.keyboardType = UIKeyboardType.default
        strainsTextField?.returnKeyType = UIReturnKeyType.done
        strainsTextField?.clearButtonMode = UITextFieldViewMode.whileEditing;
        strainsTextField?.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        //timeTextField.delegate = self.superview.view
        self.addSubview(strainsTextField!)
        
        
        gramsLabel = UILabel(frame: CGRect(x: self.bounds.width*1.5, y: 70, width: 170, height: 45))
        gramsLabel?.text = "Dose"
        gramsLabel?.textColor = timeLabel?.textColor
        gramsLabel?.font = timeLabel?.font
        gramsLabel?.layer.display()
        gramsLabel?.textAlignment = NSTextAlignment.center
        gramsLabel?.font = UIFont(name: "GillSans", size: 22.0)
        gramsLabel?.textColor = UIColor.white
        self.addSubview(gramsLabel!)
        
        gramsTextField =  UITextField(frame: CGRect(x: self.bounds.width*1.5, y: 120, width: 300, height: 40))
        gramsTextField?.placeholder = "7.5 - 25%"
        gramsTextField?.font = UIFont.systemFont(ofSize: 15)
        gramsTextField?.borderStyle = UITextBorderStyle.roundedRect
        gramsTextField?.autocorrectionType = UITextAutocorrectionType.no
        gramsTextField?.keyboardType = UIKeyboardType.default
        gramsTextField?.returnKeyType = UIReturnKeyType.done
        gramsTextField?.clearButtonMode = UITextFieldViewMode.whileEditing;
        gramsTextField?.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        //timeTextField.delegate = self.superview.view
        self.addSubview(gramsTextField!)
        
        flowerGramsSelectButton = UIButton(frame: CGRect(x: self.bounds.width*1.5, y: 200.0, width: 130.0, height: 70.0))
        flowerGramsSelectButton?.backgroundColor = PottyColors.niceBlue
        flowerGramsSelectButton?.setTitle("Grams of Pot", for: .normal)
        flowerGramsSelectButton?.setTitleColor(UIColor.white, for: .normal)
        flowerGramsSelectButton?.addTarget(nil, action: #selector(ViewController.flowersPressed(sender:)), for: .touchUpInside)
        self.addSubview(flowerGramsSelectButton!)
        
        thcMGramsSelectButton = UIButton(frame: CGRect(x: self.bounds.width*1.5, y: 200.0, width: 130.0, height: 70.0))
        thcMGramsSelectButton?.backgroundColor = PottyColors.niceBlue
        thcMGramsSelectButton?.setTitle("MG of THC", for: .normal)
        thcMGramsSelectButton?.setTitleColor(UIColor.white, for: .normal)
        thcMGramsSelectButton?.addTarget(nil, action: #selector(ViewController.thcPressed(sender:)), for: .touchUpInside)
        self.addSubview(thcMGramsSelectButton!)
        
        
        
        intakeLabel = UILabel(frame: CGRect(x: self.bounds.width*1.5, y: 70, width: 185.0, height: 45))
        intakeLabel?.text = "Consumption method"
        intakeLabel?.textColor = timeLabel?.textColor
        intakeLabel?.font = timeLabel?.font
        intakeLabel?.layer.display()
        intakeLabel?.textAlignment = NSTextAlignment.center
        intakeLabel?.font = UIFont(name: "GillSans", size: 22.0)
        intakeLabel?.textColor = UIColor.white
        self.addSubview(intakeLabel!)
        
        smokedButton = UIButton(frame: CGRect(x: self.bounds.width*1.5, y: 120.0, width: 70.0, height: 70.0))
        smokedButton?.backgroundColor = PottyColors.niceBlue
        smokedButton?.setTitle("Smoked", for: .normal)
        smokedButton?.setTitleColor(UIColor.white, for: .normal)
        smokedButton?.addTarget(nil, action: #selector(ViewController.pressSmoked(sender:)), for: .touchUpInside)
        
        self.addSubview(smokedButton!)
        
        edibleButton = UIButton(frame: CGRect(x: self.bounds.width*1.5, y: 195.0, width: 70.0, height: 70.0))
        edibleButton?.backgroundColor = PottyColors.niceBlue
        edibleButton?.setTitle("Ate", for: .normal)
        edibleButton?.setTitleColor(UIColor.white, for: .normal)
        edibleButton?.addTarget(nil, action: #selector(ViewController.pressEdible(sender:)), for: .touchUpInside)
        self.addSubview(edibleButton!)
        
        vapedButton = UIButton(frame: CGRect(x: self.bounds.width*1.5, y: 270.0, width: 70.0, height: 70.0))
        vapedButton?.backgroundColor = PottyColors.niceBlue
        vapedButton?.setTitle("Vaped", for: .normal)
        vapedButton?.setTitleColor(UIColor.white, for: .normal)
        vapedButton?.addTarget(nil, action: #selector(ViewController.pressVaped(sender:)), for: .touchUpInside)
        self.addSubview(vapedButton!)
        
        currentPage = 1
        

    }
    
    func nextPressed() {
        if currentPage == 1 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.timeLabel?.center.x = self.bounds.width/2.0
                self.timePicker?.center.x = self.bounds.width/2.0
                    
                self.dateLabel?.center.x = -200.0
                self.datePicker?.center.x = -200.0
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[1].backgroundColor = PottyColors.coreGreen
            
        } else if currentPage == 2 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.timeLabel?.center.x = -200.0
                self.timePicker?.center.x = -200.0
                    
                self.strainsLabel?.center.x = self.bounds.width/2.0
                self.strainsTextField?.center.x = self.bounds.width/2.0
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[2].backgroundColor = PottyColors.coreGreen
        } else if currentPage == 3 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.strainsLabel?.center.x = -200.0
                self.strainsTextField?.center.x = -200.0
                
                self.gramsLabel?.center.x = self.bounds.width/2.0
                self.gramsTextField?.center.x = self.bounds.width/2.0
                self.flowerGramsSelectButton?.center.x = self.bounds.width * 0.25
                self.thcMGramsSelectButton?.center.x = self.bounds.width * 0.75

            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[3].backgroundColor = PottyColors.coreGreen
        }
        else if currentPage == 4 {
            self.saveButton?.setTitle("Save", for: .normal)
            self.saveButton?.addTarget(nil, action: #selector(ViewController.pressSaveUseage), for: .touchUpInside)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.gramsLabel?.center.x = -200.0
                self.gramsTextField?.center.x = -200.0
                self.flowerGramsSelectButton?.center.x = -200.0
                self.thcMGramsSelectButton?.center.x = -200.0
            
                self.intakeLabel?.center.x = self.bounds.width/2.0
                self.smokedButton?.center.x = self.bounds.width/2.0
                self.edibleButton?.center.x = self.bounds.width/2.0
                self.vapedButton?.center.x = self.bounds.width/2.0
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[4].backgroundColor = PottyColors.coreGreen
        } else if currentPage == 5 {
            
        }
        
        currentPage = currentPage! + 1
        
    }
    
    func backPressed() {
        if currentPage == 1 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.center.y = self.bounds.height*1.9

            }, completion: { finished in
                self.removeFromSuperview()
                
            })
        } else if currentPage == 2 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.dateLabel?.center.x = self.bounds.width/2.0
                self.datePicker?.center.x = self.bounds.width/2.0
                
                self.timeLabel?.center.x = self.bounds.width * 1.5
                self.timePicker?.center.x = self.bounds.width * 1.5
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[1].backgroundColor = PottyColors.accentGray
            
        } else if currentPage == 3 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.timeLabel?.center.x = self.bounds.width/2.0
                self.timePicker?.center.x = self.bounds.width/2.0
                
                self.strainsLabel?.center.x = self.bounds.width * 1.5
                self.strainsTextField?.center.x = self.bounds.width * 1.5
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[2].backgroundColor = PottyColors.accentGray
        } else if currentPage == 4 {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.strainsLabel?.center.x = self.bounds.width/2.0
                self.strainsTextField?.center.x = self.bounds.width/2.0
                
                self.gramsLabel?.center.x = self.bounds.width * 1.5
                self.gramsTextField?.center.x = self.bounds.width * 1.5
                self.flowerGramsSelectButton?.center.x = self.bounds.width * 1.5
                self.thcMGramsSelectButton?.center.x = self.bounds.width * 1.5
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[3].backgroundColor = PottyColors.accentGray
        } else if currentPage == 5 {
            self.saveButton?.setTitle("Next", for: .normal)
            self.saveButton?.addTarget(nil, action: #selector(ViewController.pressNext), for: .touchUpInside)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.gramsLabel?.center.x = self.bounds.width/2.0
                self.gramsTextField?.center.x = self.bounds.width/2.0
                self.flowerGramsSelectButton?.center.x = self.bounds.width * 0.25
                self.thcMGramsSelectButton?.center.x = self.bounds.width * 0.75
                
                self.intakeLabel?.center.x = self.bounds.width * 1.5
                self.smokedButton?.center.x = self.bounds.width * 1.5
                self.edibleButton?.center.x = self.bounds.width * 1.5
                self.vapedButton?.center.x = self.bounds.width * 1.5
            }, completion: { finished in
                print("Basket doors opened!")
            })
            addDoseProgressView?.circles[4].backgroundColor = PottyColors.accentGray
        }
        
        
        
        currentPage = currentPage! - 1
    }
    
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
