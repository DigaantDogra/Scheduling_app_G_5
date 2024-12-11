//
//  Employer.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

class Employer:User{
    var empName:String
    private var empID:Double
    let company:Company
    
    init(username:String, password:String, empName: String = "Test", empID: Double = 1000, company: Company) {
        self.empName = empName
        self.empID = empID
        self.company = company
        super.init(userName: username, password: password)
    }
    
    func generateID() -> Double{
        let randomNumber = Int.random(in: 100...999)
        return Double(randomNumber)
    }
    
}
