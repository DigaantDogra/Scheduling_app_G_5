//
//  Associate.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Associate:User{
    var associateName:String
    private var associateID:Double
    let companyID:Double
    let associateSchedule:Schedule
    
    init(email:String, password:String, associateName: String, associateID: Double, companyID: Double, associateSchedule: Schedule) {
        self.associateName = associateName
        self.associateID = associateID
        self.companyID = companyID
        self.associateSchedule = associateSchedule
        super.init(email: email, password: password)
    }
}
