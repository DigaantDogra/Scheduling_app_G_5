//
//  Day.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

struct Day{
    let startTime:Int
    let endTime:Int
    let shiftHours:Int
    let weekDay:WeekDays
    let isAvaliable:Bool
    
    init(startTime: Int, endTime: Int, shiftHours: Int, weekDay: WeekDays, isAvaliable: Bool) {
        self.startTime = startTime
        self.endTime = endTime
        self.shiftHours = shiftHours
        self.weekDay = weekDay
        self.isAvaliable = isAvaliable
    }
    
}
