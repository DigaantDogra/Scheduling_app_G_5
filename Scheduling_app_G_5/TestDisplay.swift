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
        Text("OK")
    }
}

#Preview {
    TestDisplay()
        .environmentObject(TestViewModel())
}
