//
//  Day.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Day{
    let startTime:Date?
    let endTime:Date?
    let weekDay:WeekDays
    
    init(startTime: Date?, endTime: Date?, weekDay: WeekDays) {
        self.startTime = startTime
        self.endTime = endTime
        self.weekDay = weekDay
    }
    
}
