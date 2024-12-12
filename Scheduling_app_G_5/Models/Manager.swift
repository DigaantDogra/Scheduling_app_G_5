//
//  Manager.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Manager:User{
    var managerName:String
    private var managerID:Int
    let company:Company
    
    init(email:String, password:String, managerName: String, managerID: Int, company: Company) {
        self.managerName = managerName
        self.managerID = managerID
        self.company = company
        super.init(email: email, password: password, userType: UserType.Manager)
    }
    
    //TODO: Functions here
    
}
