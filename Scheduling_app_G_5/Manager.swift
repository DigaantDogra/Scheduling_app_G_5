//
//  Manager.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Manager:User{
    var managerName:String
    private var managerID:Double
    let companyID:Double
    
    init(email:String, password:String, managerName: String, managerID: Double, companyID: Double) {
        self.managerName = managerName
        self.managerID = managerID
        self.companyID = companyID
        super.init(email: email, password: password)
    }
    
    //TODO: Functions here
    
}
