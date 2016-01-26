//
//  ViewController.swift
//  CountDownTimer
//
//  Created by Pham ngoc Quynh on 1/15/16.
//  Copyright © 2016 Pham ngoc Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var yearMonthDayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerSrolled(sender: AnyObject) {
        _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
    }
    func updateTimer(){
        var date = fromDateToDate(datePicker.date)
        let (year, month, day) = playWithText(date)
        var str: String = ""
        (date,str) = negativeTimer(date, str: str)
        yearMonthDayLabel.text = "\(str) \(date.year)\(year)  \(date.month)\(month)  \(date.day)\(day)"
        timeLabel.text = "\(date.hour):\(date.minute):\(date.second)"
    }
    
    func playWithText(date: NSDateComponents)->(String, String, String){
        var year : String = "year"
        var month : String = "month"
        var day : String = "day"
        
        if date.year % 2 == 0 {
            year = "years"
        }
        
        if date.month % 2 == 0 {
            month = "months"
        }
        
        if date.day % 2 == 0 {
            day = "days"
        }
        
        return (year,month,day)
    }
    
    func negativeTimer (component : NSDateComponents, var str : String) -> (NSDateComponents,String) {
        if component.second < 0 {
            component.second *= -1
            component.minute *= -1
            component.hour *= -1
            component.day *= -1
            component.month *= -1
            component.year *= -1
            str = "From:"
        }
        return (component,str)
    }
    
    func fromDateToDate(day : NSDate) -> NSDateComponents{
        let date = NSDate()
        let unitFlags: NSCalendarUnit = [.Second,.Minute,.Hour, .Day, .Month, .Year]
        let component = NSCalendar.currentCalendar().components(unitFlags, fromDate: date, toDate: day, options: NSCalendarOptions.WrapComponents)
               return component
    }
}

