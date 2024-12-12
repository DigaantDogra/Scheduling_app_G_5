//
//  HomePage.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct AssociatePage: View {
    @State private var selectedTab = 0 // State to track the selected tab
    @State var associate:Associate
    @State var vm : AssociateViewModel

    var body: some View {
        NavigationStack {
            
            VStack {
                // Main content view based on the selected tab
                if selectedTab == 0 {
                    //Content for user home screen
                    GroupBox{
                        HStack{
                            Text("Upcoming Shift")
                            Spacer()
                            Button{
                                
                            }label:{
                                Text("Details")
                            }
                        }
                        
                        Text("\(vm.latestShift())")
                        
                    } // Gbox
                    .padding()
                } else if selectedTab == 1 {
                    //Content for user calendar
                    Text("Calendar Content")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                } else if selectedTab == 2 {
                    //Content for user profile
                    Text("Profile Content")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                }
            }.navigationTitle("Hi \(associate.associateName)")
                .foregroundColor(.purple)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Image(systemName: "person.circle.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(.purple)
                    
                    Spacer()
                    
                    Image(systemName: "tray.and.arrow.down.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(.purple)
                }
            }.frame(maxWidth:. infinity)
            .toolbar {
                // Bottom Tab Bar
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    
                    // Tab 1 (Home)
                    Button(action: {
                        selectedTab = 0
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(selectedTab == 0 ? .purple : .gray)
                        }
                    }
                    
                    Spacer()
                    
                    // Tab 2 (Search)
                    Button(action: {
                        selectedTab = 1
                    }) {
                        VStack {
                            Image(systemName: "calendar")
                                .foregroundColor(selectedTab == 1 ? .purple : .gray)
                            
                        }
                    }
                    
                    Spacer()
                    
                    // Tab 3 (Profile)
                    Button(action: {
                        selectedTab = 2
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(selectedTab == 2 ? .purple : .gray)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AssociatePage(associate: Associate(email: "test@test.com", password: "1234567", associateName: "Test", associateID: 0, company: Company(companyName: "Company", companyID: 0), associateSchedule: [Schedule(workDate: Date(), startTime: Date(), endTime: Date(), shiftHours: 8, isScheduled: true)], associateAvaliability: [Avaliability(startTime: Date(), endTime: Date(), weekDay: WeekDays.Monday, isAvaliable: true)]), vm: AssociateViewModel(associate: Associate(email: "test@test.com", password: "1234567", associateName: "Test", associateID: 0, company: Company(companyName: "Company", companyID: 0), associateSchedule: [Schedule(workDate: Date(), startTime: Date(), endTime: Date(), shiftHours: 8, isScheduled: true)], associateAvaliability: [Avaliability(startTime: Date(), endTime: Date(), weekDay: WeekDays.Monday, isAvaliable: true)])))
}
