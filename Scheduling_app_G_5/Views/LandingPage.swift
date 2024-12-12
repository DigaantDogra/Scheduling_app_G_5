//
//  ContentView.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct LandingPage: View {
    @State private var isUserLoggedIn = false
    @State private var user:User?
    
    var body: some View {
        if isUserLoggedIn{
            switch user!.userType {
            case .Employer:
                EmptyView() // Employer Page
            case .Manager:
                EmptyView() // Manager Page
            case .Associate:
                AssociatePage(associate: user as! Associate, vm: AssociateViewModel(associate: user as! Associate))
            }
        }else{
            WelcomePage(isUserLoggedIn: $isUserLoggedIn, user: $user)
        }
    }
    
}

#Preview {
    LandingPage()
}

