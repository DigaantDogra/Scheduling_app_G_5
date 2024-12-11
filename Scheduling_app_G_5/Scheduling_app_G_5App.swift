//
//  Scheduling_app_G_5App.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-10-31.
//

import SwiftUI
import Firebase

@main
struct Scheduling_app_G_5App: App {
    @StateObject var vm = TestViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TestUserAuth()
//            TestDisplay()
//                .environmentObject(vm)
//            TestUserAuth()
//            LandingPage()
        }
    }
}
