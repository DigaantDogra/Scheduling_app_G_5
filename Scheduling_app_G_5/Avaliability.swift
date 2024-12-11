//
//  Avaliability.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Avaliability:Day{
    let isAvaliable:Bool
    
    init(startTime: Date?, endTime: Date?, weekDay: WeekDays, isAvaliable: Bool) {
        self.isAvaliable = isAvaliable
        super.init(startTime: startTime, endTime: endTime, weekDay: weekDay)
    }
}
