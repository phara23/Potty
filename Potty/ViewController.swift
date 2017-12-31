//
//  ViewController.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import UIKit
import FSCalendar
import BEMSimpleLineGraph

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, BEMSimpleLineGraphDelegate, BEMSimpleLineGraphDataSource {
    
    var dailyAmounts: [String: Double]?
    var calendar: FSCalendar!
    var titleView: TitleView!
    var mainMenuView: MainMenuView!
    var addDoseView: AddDoseView?
    var insightsView: InsightsView?
    
    let titleHeight: Double = 60
    let menuHeight:Double = 55
    let calendarHeight: Double = 350

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var lineGraph: BEMSimpleLineGraphView?
    
    let numberOfGraphPoints = 14
    
    var user: User?
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        
        let view = UIView(frame: UIScreen.main.bounds)
        //view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        titleView = TitleView(frame: CGRect(x: 0.0, y: 0.0, width: Double(self.view.bounds.width), height: titleHeight))
        self.view.addSubview(titleView)
        
        mainMenuView = MainMenuView(frame: CGRect(x: 0.0, y: titleHeight, width: Double(self.view.bounds.width), height: menuHeight))
        self.view.addSubview(mainMenuView)
        
        dailyAmounts = [String: Double]()
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: titleHeight + menuHeight, width: Double(self.view.bounds.width), height: calendarHeight))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor.white
        calendar.appearance.eventColor = UIColor.green
        calendar.appearance.weekdayTextColor = UIColor.red
        self.view.addSubview(calendar)
        calendar.reloadData()
        
        self.title = "FS Calendar"
        
        lineGraph = BEMSimpleLineGraphView(frame: CGRect(x: Double(screenWidth), y: titleHeight + menuHeight, width: Double(screenWidth), height: calendarHeight))
        lineGraph?.dataSource = self
        lineGraph?.delegate = self
        lineGraph?.enableBezierCurve = true
        //lineGraph?.enableYAxisLabel = true
        //lineGraph?.alphaBackgroundYaxis = 3.0
        //lineGraph?.alphaLine = 4.0
        lineGraph?.alwaysDisplayDots = true
        lineGraph?.alwaysDisplayPopUpLabels = true
        lineGraph?.autoScaleYAxis = true
        lineGraph?.widthLine = 5.0
        
        self.view.addSubview(lineGraph!)
        
        userSetup()
        
        var sum = 0.0
        for vv in (dailyAmounts?.values)! {
            sum += vv
        }
        
        var earliestDate: Date? = nil
        for aa in (dailyAmounts?.keys)! {
            print("FUC")
            print(aa)
        }
        var inputSmokedAmount = 0.0
        var inputAteAmount = 0.0
        var inputVapedAmount = 0.0
        for useage in (user?.useages)! {
            if useage.intakeMethods[0] == "smoked" {
                inputSmokedAmount += inputSmokedAmount
            } else if useage.intakeMethods[0] == "edbile" {
                inputAteAmount += inputAteAmount
            } else if useage.intakeMethods[0] == "vaped" {
                inputVapedAmount += inputVapedAmount
            }
        }
        
        var totalSpent = sum * 0.04
        
        insightsView = InsightsView(frame: CGRect(x: 0.0, y: titleHeight + menuHeight + calendarHeight, width: Double(screenWidth), height: Double(screenHeight*0.9)), inputConsumedAmount: sum, inputConsumedChangeLabel: String(describing: dailyAmounts!.count), inputSinceWhen: "!", inputAmountSpent: String(totalSpent), inputSmokedAmount: String(inputSmokedAmount), inputVapedAmount: String(inputVapedAmount), inputAteAmount: String(inputAteAmount))
        
        self.view.addSubview(insightsView!)
        
    }
    
    func GetDateFromString(DateStr: String)-> Date
    {
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let DateArray = DateStr.components(separatedBy: "/")
        let components = NSDateComponents()
        components.year = Int(DateArray[2])!
        components.month = Int(DateArray[1])!
        components.day = Int(DateArray[0])!
        components.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = calendar?.date(from: components as DateComponents)
        
        return date!
    }
    
    func userSetup() {
        user = loadUser()
        
        if user == nil {
            print("USER WAS NIL")
            user = User(inputUserID: "MarkieMark", inputPreferredSurveyTime: "", inputUseages: [], inputSurveys: [])
            saveUser()
        } else {
            print("USER WAS NOT NIL")
            print(user?.userID)
            for newUseage in (user?.useages)! {
                if let gg = dailyAmounts?[newUseage.dateOf] {
                    dailyAmounts?[newUseage.dateOf] = (dailyAmounts?[newUseage.dateOf]!)! + newUseage.grams
                } else{
                    dailyAmounts?[newUseage.dateOf] = newUseage.grams
                }
            }
            
            lineGraph?.reloadGraph()
            calendar.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calendar delegates
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        let dateString = date.toString(dateFormat: "dd-MM-yy")
        if let gg = dailyAmounts?[dateString] {
            print(String(describing: dailyAmounts![dateString]!))
            return String(describing: dailyAmounts![dateString]!) + "mg"
        } else{
            return ""
        }
    }
    
    func calendar(_ calendar: FSCalendar, hasEventFor date: Date) -> Bool {
        return false
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    
    
    func switchChanged(sender: UISwitch!) {
        print("Switch value 69 is \(sender.isOn)")
        
        if sender.isOn {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.calendar.center.x = -self.screenWidth*1.9
                self.lineGraph!.center.x = self.screenWidth/2.0
            }, completion: { finished in
                print("Basket doors opened!")
            })

        } else {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.calendar.center.x = self.screenWidth/2.0
                self.lineGraph!.center.x = self.screenWidth*1.9
            }, completion: { finished in
                print("Basket doors opened!")
            })
        }
        
    }
    
    
    func pressBack() {
        print("Close Pressed")
        print(self.addDoseView?.currentPage)
        self.addDoseView!.backPressed()
        print(self.addDoseView?.currentPage)
        if self.addDoseView?.currentPage == 0 {
            print("zzz in")
            self.addDoseView = nil
        }
        /*UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
            self.addDoseView!.center = CGPoint(x: (self.screenWidth/2.0), y: (self.screenHeight*1.8))
        }, completion: { finished in
            print("Basket doors opened!")
            self.addDoseView?.removeFromSuperview()
        })*/
    }
    
    func pressNext() {
        print("Next Pressed")
        self.addDoseView!.nextPressed()
        /*UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
            self.addDoseView!.center = CGPoint(x: (self.screenWidth/2.0), y: (self.screenHeight*1.8))
        }, completion: { finished in
            print("Basket doors opened!")
            self.addDoseView?.removeFromSuperview()
        })*/
    }
    
    func pressAddUseage()  {
        print("BUTTON PRESSED12")
        print(addDoseView)
        
        if addDoseView == nil {
            addDoseView = AddDoseView(frame: CGRect(x: 10.0, y: screenHeight, width: (screenWidth-10.0), height: screenHeight*0.7))
            addDoseView?.strainsTextField?.delegate = self
            addDoseView?.gramsTextField?.delegate = self
            //addDoseView?.timeTextField?.delegate = self
            self.view.addSubview(addDoseView!)
            
            if calendar.selectedDate == nil {
                UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                    self.addDoseView?.center = CGPoint(x: (self.screenWidth/2.0), y: (self.screenHeight/2.0))
                }, completion: { finished in
                    print("Basket doors opened!")
                })
            } else {
                self.addDoseView?.datePicker?.date = calendar.selectedDate!
                self.addDoseView?.center = CGPoint(x: (self.screenWidth/2.0), y: (self.screenHeight/2.0))
                pressNext()
            }
        }
    }
    
    func pressSaveUseage() {
        let dateParameter = (self.addDoseView?.datePicker?.date.toString(dateFormat: "dd-MM-yy"))!
        let timeParameter = (self.addDoseView?.timePicker?.date.toString(dateFormat: "mm-hh"))!
        let strainsParameter = self.addDoseView?.strainsTextField?.text?.components(separatedBy: ",")
        var gramsParameter = Double((self.addDoseView?.gramsTextField?.text)!)
        
        if (self.addDoseView?.flowerGramsSelectButton?.isSelected)! {
            gramsParameter = gramsParameter! * 0.22 * 1000
        }
        
        var intakeMethodsParameter = [String]()
        if (self.addDoseView?.smokedButton?.isSelected)! {
            intakeMethodsParameter.append("smoked")
        }
        if (self.addDoseView?.edibleButton?.isSelected)! {
            intakeMethodsParameter.append("edbile")
        }
        if (self.addDoseView?.vapedButton?.isSelected)! {
            intakeMethodsParameter.append("vaped")
        }
        
        let userIDParameter = user?.userID
        
        
        let newUseage = Useage(inputDate: dateParameter, inputTime: timeParameter, inputStrains: strainsParameter!, inputGrams: Double(gramsParameter!), inputIntakeMethods: intakeMethodsParameter, inputUserID: userIDParameter!, inputLocation: "Compton")
        
        print(user?.useages?.count)
        user?.addUseage(inputUseage: newUseage)
        print("----- USEAGE ADDED -----")
        print(user?.useages?.count)
        
        if let gg = dailyAmounts?[newUseage.dateOf] {
            dailyAmounts?[newUseage.dateOf] = (dailyAmounts?[newUseage.dateOf]!)! + newUseage.grams
        } else{
            dailyAmounts?[newUseage.dateOf] = newUseage.grams
        }
        
        dump(dailyAmounts)
        calendar.reloadData()
        addDoseView?.removeFromSuperview()
        addDoseView = nil
        lineGraph?.reloadGraph()
        
        saveUser()
        
        var sum = 0.0
        for vv in (dailyAmounts?.values)! {
            sum += vv
        }
        
        var inputSmokedAmount = 0.0
        for useage in (user?.useages)! {
            if useage.intakeMethods[0] == "smoked" {
                inputSmokedAmount += inputSmokedAmount
            }
        }
        
        insightsView?.consumedAmount?.text =  String(sum)
        insightsView?.daysSmoked?.text = String(describing: dailyAmounts!.count)
        insightsView?.smokedAmount?.text = String(inputSmokedAmount)
        insightsView?.amountSpent?.text = String(sum * 0.04)
    }
    
    func startTimeDiveChanged(sender: UIDatePicker) {
        /*let formatter = DateFormatter()
        formatter.timeStyle = .short
        youtTextFieldName.text = formatter.string(from: sender.date)
        timePicker.removeFromSuperview() // if you want to remove time picker*/
    }
    
    func startDateDiveChanged(sender: UIDatePicker) {
        /*let formatter = DateFormatter()
         formatter.timeStyle = .short
         youtTextFieldName.text = formatter.string(from: sender.date)
         timePicker.removeFromSuperview() // if you want to remove time picker*/
    }
    
    func pressSmoked(sender: UIButton!) {
        if sender.isSelected == false {
            sender.isSelected = true
            sender.backgroundColor = PottyColors.coreGreen
        } else {
            sender.isSelected = false
            sender.backgroundColor = PottyColors.niceBlue
        }
    }

    func pressEdible(sender: UIButton!) {
        if sender.isSelected == false {
            sender.isSelected = true
            sender.backgroundColor = PottyColors.coreGreen
        } else {
            sender.isSelected = false
            sender.backgroundColor = PottyColors.niceBlue
        }
    }
    
    
    func pressVaped(sender: UIButton!) {
        if sender.isSelected == false {
            sender.isSelected = true
            sender.backgroundColor = PottyColors.coreGreen
        } else {
            sender.isSelected = false
            sender.backgroundColor = PottyColors.niceBlue
        }
    }
    
    func flowersPressed(sender: UIButton!) {
        if sender.isSelected == false {
            sender.isSelected = true
            sender.backgroundColor = PottyColors.coreGreen
            addDoseView?.thcMGramsSelectButton?.isSelected = false
            addDoseView?.thcMGramsSelectButton?.backgroundColor = PottyColors.niceBlue
        } else {
            sender.isSelected = false
            sender.backgroundColor = PottyColors.niceBlue
            addDoseView?.thcMGramsSelectButton?.isSelected = true
            addDoseView?.thcMGramsSelectButton?.backgroundColor = PottyColors.coreGreen
        }
    }
    
    func thcPressed(sender: UIButton!) {
        if sender.isSelected == false {
            sender.isSelected = true
            sender.backgroundColor = PottyColors.coreGreen
            addDoseView?.flowerGramsSelectButton?.isSelected = false
            addDoseView?.flowerGramsSelectButton?.backgroundColor = PottyColors.niceBlue
        } else {
            sender.isSelected = false
            sender.backgroundColor = PottyColors.niceBlue
            addDoseView?.flowerGramsSelectButton?.isSelected = true
            addDoseView?.flowerGramsSelectButton?.backgroundColor = PottyColors.coreGreen
        }
    }
    
    func insightsPressed() {
        print("OINK")
        if (self.insightsView?.isMaximized)! {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.insightsView?.center.y = self.screenHeight*1.15
                self.insightsView?.isMaximized = false
            }, completion: { finished in
                print("Basket doors opened!")
            })
        } else {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                self.insightsView?.center.y = self.screenHeight*0.53
                self.insightsView?.isMaximized = true
            }, completion: { finished in
                print("Basket doors opened!")
            })
        }
    }
    
    
    //Line graph delegates
    
    public func numberOfPoints(inLineGraph graph: BEMSimpleLineGraphView) -> Int {
        return numberOfGraphPoints
    }
    
    public func lineGraph(_ graph: BEMSimpleLineGraphView, valueForPointAt index: Int) -> CGFloat {
        let calendar = Calendar.current
        let dateValue = calendar.date(byAdding: .day, value: -(numberOfGraphPoints-index-1), to: Date())
        let dateValueString = dateValue?.toString(dateFormat: "dd-MM-yy")
        
        print("AY")
        print(dateValueString)
        
        if let gg = dailyAmounts?[dateValueString!] {
            print(String(describing: dailyAmounts![dateValueString!]!))
            return CGFloat(dailyAmounts![dateValueString!]!)
        } else{
            return 0.0
        }
        
        return CGFloat(index)
    }
    
    public func lineGraph(_ graph: BEMSimpleLineGraphView, labelOnXAxisFor index: Int) -> String? {
        let calendar = Calendar.current
        let dateValue = calendar.date(byAdding: .day, value: -(numberOfGraphPoints-index), to: Date())
        let dateValueString = dateValue?.toString(dateFormat: "dd-MM")
        
        return dateValueString
    }
    
    
    //Data Persistance
    private func saveUser() {
        print("BARK1")
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(user, toFile: User.ArchiveURL.path)
        print("BARK2")
        if isSuccessfulSave {
            print("User successfully saved.")
        } else {
            print("Failed to save user...")
        }
    }
    
    private func loadUser() -> User? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
    

}

// MARK:- ---> UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        textField.resignFirstResponder()
        // may be useful: textField.resignFirstResponder()
        return true
    }
    
    
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

