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
    let company:Company
    let associateSchedule:[Schedule]
    let associateAvaliability:[Avaliability]
    
    init(email:String, password:String, associateName: String, associateID: Double, company: Company, associateSchedule: [Schedule], associateAvaliability:[Avaliability]) {
        self.associateName = associateName
        self.associateID = associateID
        self.company = company
        self.associateSchedule = associateSchedule
        self.associateAvaliability = associateAvaliability
        super.init(email: email, password: password)
    }
}
