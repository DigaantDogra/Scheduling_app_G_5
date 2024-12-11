//
//  Schedule.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Schedule:Day{
    let breakTime:Int = 15
    private(set) var noOfBreak:Int?
    let isScheduled:Bool
    let shiftHours:Int?
    
    init(startTime: Date?, endTime: Date?, shiftHours: Int?, weekDay: WeekDays, noOfBreak: Int?, isScheduled: Bool) {
        self.noOfBreak = noOfBreak
        self.isScheduled = isScheduled
        self.shiftHours = shiftHours
        super.init(startTime: startTime, endTime: endTime, weekDay: weekDay)
    }
}
