//
//  ContentView.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct LandingPage: View {
    @State private var isUserLoggedIn = false
    @State private var associate:Associate?
    @State private var employer:Employer?
    @State private var manager:Manager?
    
    var body: some View {
        if isUserLoggedIn{
            if employer != nil{
                EmptyView()
            }
            if manager != nil{
                EmptyView()
            }
            if associate != nil{
                AssociatePage(associate: associate!, vm: AssociateViewModel(associate: associate!))
            }
        }else{
            WelcomePage(isUserLoggedIn: $isUserLoggedIn, employer: $employer, manager: $manager, associate: $associate)
        }
    }
    
}

#Preview {
    LandingPage()
}

