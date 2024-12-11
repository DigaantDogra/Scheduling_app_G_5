//
//  TestDisplay.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-10.
//

import SwiftUI

struct TestDisplay: View {
    @EnvironmentObject var vm:TestViewModel
    var body: some View {
        NavigationView {
            List(vm.employers, id: \.empID) { emp in
                Text("\(emp.company)")
            }
            .navigationTitle("Employers")
            .navigationBarItems(trailing: Button(action: {
                // add
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

#Preview {
    TestDisplay()
        .environmentObject(TestViewModel())
}
