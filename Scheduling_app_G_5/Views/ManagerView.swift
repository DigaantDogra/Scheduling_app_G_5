//
//  ManagerPage.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-12.
//

import SwiftUI

struct ManagerPage: View {
    @Binding var isUserLoggedIn: Bool  // Binding for handling logout
    @State private var selectedTab = 0 // State to track the selected tab
    @State var manager: Manager

    var body: some View {
        NavigationStack {
            VStack {
                if selectedTab == 0 {
                    // Content for viewing employee shifts
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: {
                                // Action for viewing associates
                            }) {
                                Text("View Associates")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: 200, maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
                            }
                            .padding(.leading, 20)

                            Button(action: {
                                // Action for viewing schedules
                            }) {
                                Text("View Schedules")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: 200, maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
                            }
                            .padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .frame(height: 150)

                        Spacer()
                    }
                } else if selectedTab == 1 {
                    // Content for team calendar
                    Text("Team Calendar")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                } else if selectedTab == 2 {
                    // Content for manager profile
                    Text("Manager Profile")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                }
            }
            .navigationTitle("Welcome, \(manager.managerName)")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.purple)
                        .padding(.top, 7)

                    Button("Logout") {
                        isUserLoggedIn = false  // Logout action
                    }
                    .foregroundColor(.purple)
                }
            }
            .toolbar {
                // Bottom Tab Bar
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()

                    // Tab 1 (Shifts)
                    Button(action: { selectedTab = 0 }) {
                        Image(systemName: "person.3.fill")
                            .foregroundColor(selectedTab == 0 ? .purple : .gray)
                    }

                    Spacer()

                    // Tab 2 (Calendar)
                    Button(action: { selectedTab = 1 }) {
                        Image(systemName: "calendar")
                            .foregroundColor(selectedTab == 1 ? .purple : .gray)
                    }

                    Spacer()

                    // Tab 3 (Profile)
                    Button(action: { selectedTab = 2 }) {
                        Image(systemName: "person.fill")
                            .foregroundColor(selectedTab == 2 ? .purple : .gray)
                    }

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ManagerPage(
        isUserLoggedIn: .constant(true),
        manager: Manager(
            email: "manager@test.com",
            password: "1234567",
            managerName: "Alex Smith",
            managerID: 1,
            company: Company(companyName: "TechCorp", companyID: 101)
        )
    )
}

