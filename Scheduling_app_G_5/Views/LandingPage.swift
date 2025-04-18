//
//  ContentView.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct LandingPage: View {
    @State private var isUserLoggedIn = false
    @State private var associate: Associate?
    @State private var employer: Employer?
    @State private var manager: Manager?

    var body: some View {
        ZStack {
            if isUserLoggedIn {
                if let employer = employer {
                    // Replace with your EmployerPage view when implemented
                    EmptyView()
                } else if let manager = manager {
                    ManagerPage(isUserLoggedIn: $isUserLoggedIn, manager: manager)
                } else if let associate = associate {
                    AssociatePage(isUserLoggedIn: $isUserLoggedIn, associate: associate, vm: AssociateViewModel(associate: associate))
                }
            } else {
                WelcomePage(isUserLoggedIn: $isUserLoggedIn, employer: $employer, manager: $manager, associate: $associate)
            }
        }
        .animation(.easeInOut, value: isUserLoggedIn)
    }
}


#Preview {
    LandingPage()
}

