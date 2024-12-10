//
//  Manager.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Manager:User{
    var empName:String
    private var empID:Double
    let companyID:Double
    
    init(userName:String, password:String, empName: String, empID: Double, companyID: Double) {
        self.empName = empName
        self.empID = empID
        self.companyID = companyID
        super.init(userName: userName, password: password)
    }
    
    //TODO: Functions here
    
}
