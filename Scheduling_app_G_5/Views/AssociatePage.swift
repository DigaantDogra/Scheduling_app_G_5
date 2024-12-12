//
//  HomePage.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI
import MapKit

struct AssociatePage: View {
    @State private var showAlert = false
    @Binding var isUserLoggedIn:Bool
    @State private var selectedTab = 1 // State to track the selected tab
    @State var associate:Associate
    @State var vm : AssociateViewModel
    var location:CLLocationCoordinate2D{
            CLLocationCoordinate2D(latitude: 43.4692, longitude: -79.6910)
        }

    var body: some View {
        NavigationStack {
            VStack {
                // Main content view based on the selected tab
                if selectedTab == 0 {
                    //Content for user home screen
                    ScrollView{
                        GroupBox{
                            HStack{
                                Text("Upcoming Shift")
                                Spacer()
                                Button{
                                    selectedTab = 1
                                }label:{
                                    Text("Details")
                                }
                            }
                            .padding(.bottom,10)
                            HStack{
                                Text("\(vm.latestShift())")
                                Spacer()
                            }
                            
                            Map(position: .constant(.camera(MapCamera(centerCoordinate: location, distance: 3000)))){
                                Annotation("ok", coordinate: location) {
                                    Image(systemName: "mappin")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .symbolEffect(.pulse)
                                }
                                .annotationTitles(.hidden)
                            }
                            .clipShape(.rect(cornerRadius: 15))
                            .padding()
                            .scaledToFit()
                            
                        } // Gbox
                        .padding()
                        
                        GroupBox{
                            HStack {
                                Text("Earnings this week")
                                Spacer()
                                Button{
                                    
                                }label:{
                                    Text("Details")
                                }
                            }
                            .padding(.bottom, 10)
                            
                            HStack{
                                Text("Total Hours Worked: ")
                                Spacer()
                                Text("(Net earning this week)")
                            }
                            
                        }
                        .padding()
                    }
                }
                else if selectedTab == 1 {
                    //Content for user calendar
                    Text("Calendar Content")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                else if selectedTab == 2 {
                    //Content for user profile
                    VStack{
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 55))
                            .padding(2)
                        Text("\(associate.associateName)")
                            .font(.largeTitle)
                        Text("\(associate.userType)")
                            .font(.title2)
                        
                        GroupBox{
                            Text("Company Name: \(associate.company.companyName)")
                            Text("Company ID: \(associate.company.companyID)")
                        }
                        .padding()
                    }
                }
            }.navigationTitle("Hi \(associate.associateName)")
                .foregroundColor(.purple)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        showAlert = true
                    }label: {
                        Image(systemName: "person.fill.badge.minus")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.purple)
                                                    .padding(.top,7)
                    }
                    .alert("Do you want to Log-out?", isPresented: $showAlert) {
                        Button("Yes", role: .none) {
                            isUserLoggedIn = false
                        }
                        Button("Cancel", role: .cancel) {
                            showAlert = false
                        }
                    } message: {
                        Text("Do you want to proceed with this action?")
                    }
                    Spacer()
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
    AssociatePage(isUserLoggedIn: .constant(true), associate: Associate(email: "test@test.com", password: "1234567", associateName: "Test", associateID: 0, company: Company(companyName: "Company", companyID: 0), associateSchedule: [Schedule(workDate: Date(), startTime: Date(), endTime: Date(), shiftHours: 8, isScheduled: true)], associateAvaliability: [Avaliability(startTime: Date(), endTime: Date(), weekDay: WeekDays.Monday, isAvaliable: true)]), vm: AssociateViewModel(associate: Associate(email: "test@test.com", password: "1234567", associateName: "Test", associateID: 0, company: Company(companyName: "Company", companyID: 0), associateSchedule: [Schedule(workDate: Date(), startTime: Date(), endTime: Date(), shiftHours: 8, isScheduled: true)], associateAvaliability: [Avaliability(startTime: Date(), endTime: Date(), weekDay: WeekDays.Monday, isAvaliable: true)])))
}
