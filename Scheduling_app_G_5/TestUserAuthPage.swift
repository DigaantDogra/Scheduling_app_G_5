//
//  TestUserAuthPage.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import SwiftUI

struct TestUserAuthPage: View {
    @EnvironmentObject var vm:TestViewModel
    var body: some View {
        NavigationView {
            List(vm.companies, id: \.companyID) { company in
                Text("\(company.companyID)")
            }
            .navigationTitle("Companies")
            .navigationBarItems(trailing: Button(action: {
                // add
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

#Preview {
    TestUserAuthPage()
        .environmentObject(TestViewModel())
}
