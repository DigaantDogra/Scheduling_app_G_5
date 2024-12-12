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
    let shiftHours:Int
    let workDate:Date
    
    init(workDate:Date ,startTime: Date?, endTime: Date?, shiftHours: Int, isScheduled: Bool) {
        self.shiftHours = shiftHours
        self.isScheduled = isScheduled
        self.workDate = workDate
        super.init(startTime: startTime, endTime: endTime)
        self.noOfBreak = breaksCount(for: self.shiftHours)
    }
    
    private func breaksCount(for shiftHours:Int)->Int{
        if shiftHours <= 6{
            return 1
        }else{
            return 2
        }
    }
}
