//
//  calculatorFromDateToOtherDate.swift
//  CountDownTimer
//
//  Created by Pham ngoc Quynh on 1/25/16.
//  Copyright © 2016 Pham ngoc Quynh. All rights reserved.
//

import Foundation
func fromDateToDate(day : NSDate) -> NSDateComponents{
    let date = NSDate()
    let unitFlags: NSCalendarUnit = [.Second,.Minute,.Hour, .Day, .Month, .Year]
    let component = NSCalendar.currentCalendar().components(unitFlags, fromDate: date, toDate: day, options: NSCalendarOptions.WrapComponents)
    return component
}
