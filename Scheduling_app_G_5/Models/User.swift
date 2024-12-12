//
//  User.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-11-19.
//

import Foundation

class User{
    let email:String
    let password:String
    let userType:UserType
    
    init(email:String, password:String, userType:UserType) {
        self.password = password
        self.email = email
        self.userType = userType
    }
}
