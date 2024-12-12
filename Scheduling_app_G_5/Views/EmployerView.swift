//
//  EmployerPage.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct EmployerView: View {
    @State private var selectedTab = 0 // State to track the selected tab
    @State var employer: Employer
    //@State var vm: EmployerViewModel

    var body: some View {
        NavigationStack {
            VStack {
                // Main content view based on the selected tab
                if selectedTab == 0 {
                    // Content for employer dashboard
                    GroupBox {
                        HStack {
                            Text("Pending Approvals")
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("View All")
                            }
                        }
                    
                    }
                    .padding()
                } else if selectedTab == 1 {
                    // Content for employer calendar
                    Text("Team Schedule")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                } else if selectedTab == 2 {
                    // Content for employer profile
                    Text("Profile Content")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                }
            }
            .navigationTitle("Hi \(employer.empName)")
            .foregroundColor(.purple)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "briefcase.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.purple)
                        .padding(.top, 7)
                    
                    Spacer()
                    
                    Image(systemName: "tray.and.arrow.down.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.purple)
                }
            }
            .frame(maxWidth: .infinity)
            .toolbar {
                // Bottom Tab Bar
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    
                    // Tab 1 (Dashboard)
                    Button(action: {
                        selectedTab = 0
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(selectedTab == 0 ? .purple : .gray)
                        }
                    }
                    
                    Spacer()
                    
                    // Tab 2 (Calendar)
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
    EmployerView(
        employer: Employer(
            email: "Employer@test.com",
            password: "1234567",
            empName: "Employer",
            empID: 1,
            company: Company(companyName: "TechCorp", companyID: 123)
        )
    )
}
