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
        let date = fromDateToDate(datePicker.date)
        yearMonthDayLabel.text = "\(date.year)years  \(date.month)month  \(date.day)days"
        timeLabel.text = "\(date.hour):\(date.minute):\(date.second)"
    }
   
    func fromDateToDate(day : NSDate) -> NSDateComponents{
        let date = NSDate()
        let unitFlags: NSCalendarUnit = [.Second,.Minute,.Hour, .Day, .Month, .Year]
        let component = NSCalendar.currentCalendar().components(unitFlags, fromDate: date, toDate: day, options: NSCalendarOptions.WrapComponents)
        return component
    }
}

