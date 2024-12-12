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
                dateFormatter.dateFormat = "EEEE"
                let workDay = dateFormatter.string(from: date.workDate)
                dateFormatter.dateFormat = "hh:mm a"
                let stime = dateFormatter.string(from: date.startTime!)
                let etime = dateFormatter.string(from: date.endTime!)
//                if Calendar.current.isDate(date.startTime!, equalTo: current, toGranularity: .minute){
//                    associate.associateSchedule.remove(at: index)
//                }
                
                return "\(workTime)  \(workDay) \(stime) - \(etime)"
            }
        }
        
        return "You are Not Scheduled"
    }
    
}
