//
//  SignUpView.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
            

            
            // Sign Up Button
            Button("Create Account") {
                // Sign-up logic here
            }
            .bold()
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(12)
            .foregroundColor(.white)
            .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
        }
        .padding(.horizontal, 30)
        .padding(.top, 50)
    }
}

#Preview {
    SignUpView()
}
