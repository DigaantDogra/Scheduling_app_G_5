//
//  AssociateViewModel.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-12.
//

import Foundation

struct AssociateViewModel{
    var associate:Associate
    
    init(associate: Associate) {
        self.associate = associate
    }
    
    func latestShift()->String{
        let dateFormatter = DateFormatter()
        let current = Date()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for (index,date) in associate.associateSchedule.enumerated(){
            if !date.isScheduled{
                continue
            }else{
                let workTime = dateFormatter.string(from: date.workDate)
//                if Calendar.current.isDate(date.startTime!, equalTo: current, toGranularity: .minute){
//                    associate.associateSchedule.remove(at: index)
//                }
                let workDay = date.weekDay!
                return "\(workTime)  \(workDay.rawValue)"
            }
        }
        
        return "You are Not Scheduled"
    }
    
}
