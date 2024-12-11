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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Formater Time :\(currentDateString)")
            Button{
                print()
            }label: {
                Text("ok")
            }
        }
        .padding()
        .onAppear{
            dateFormatter.dateFormat = "hh:mm a"
            self.currentDateString = dateFormatter.string(from: Date())
        }
    }
}

#Preview {
    ContentView()
}
