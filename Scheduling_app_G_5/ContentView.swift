//
//  ContentView.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-10-31.
//  Project Initialized

import SwiftUI

struct ContentView: View {
    let dateFormatter = DateFormatter()
    @State var currentDateString = ""
    @State var current = 0
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Formater Time :\(current)")
            Button{
                print()
            }label: {
                Text("ok")
            }
        }
        .padding()
        .onAppear{
            dateFormatter.dateFormat = "HHmm"
            self.currentDateString = dateFormatter.string(from: Date())
            self.current = Int(self.currentDateString) ?? 0
        }
    }
}

#Preview {
    ContentView()
}
