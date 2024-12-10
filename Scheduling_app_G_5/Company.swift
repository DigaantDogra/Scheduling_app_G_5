//
//  Company.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

struct Company{
    let companyName:String
    private(set) var companyID:Double
    
    private mutating func generateID(){
        let randomNumber = Int.random(in: 100...999)
        companyID = Double(randomNumber)
    }
    
    init(companyName: String, companyID: Double) {
        self.companyName = companyName
        self.companyID = companyID
        
        generateID()
    }
}
