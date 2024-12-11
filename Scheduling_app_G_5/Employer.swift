//
//  Employer.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Employer:User{
    var empName:String
    var empID:Int
    let company:Company
    
    init(email:String, password:String, empName: String, empID: Int, company: Company) {
        self.empName = empName
        self.empID = empID
        self.company = company
        super.init(email: email, password: password)
    }
    
    
}
