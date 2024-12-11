//
//  Company.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import Foundation

struct Company{
    let companyName:String
    private(set) var companyID:Int
    
    init(companyName: String, companyID:Int) {
        self.companyName = companyName
        self.companyID = companyID
    }
}
