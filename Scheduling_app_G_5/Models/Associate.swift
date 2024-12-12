//
//  Associate.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Associate:User{
    var associateName:String
    private var associateID:Int
    let company:Company
    var associateSchedule:[Schedule]
    var associateAvaliability:[Avaliability]
    
    init(email:String, password:String, associateName: String, associateID: Int, company: Company, associateSchedule: [Schedule], associateAvaliability:[Avaliability]) {
        self.associateName = associateName
        self.associateID = associateID
        self.company = company
        self.associateSchedule = associateSchedule
        self.associateAvaliability = associateAvaliability
        super.init(email: email, password: password, userType: UserType.Associate)
    }
}
