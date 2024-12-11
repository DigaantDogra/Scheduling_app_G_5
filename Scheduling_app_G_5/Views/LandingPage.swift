//
//  ContentView.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-10-31.
//  Project Initialized

import SwiftUI

struct LandingPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Welcome")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .padding(.bottom,20)
                    
                    TextField("", text: $email)
                        .foregroundStyle(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty){
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                            
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    SecureField("", text: $password)
                        .foregroundStyle(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty){
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    Button("Login"){
                        //Button Logic to go to home page here
                    }
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(.linearGradient(colors: [.indigo], startPoint: .center, endPoint: .zero)))
                    .foregroundStyle(.white)
                    
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(.linearGradient(colors: [.indigo,.purple], startPoint: .top, endPoint: .bottom))
                            )
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(width: 350)
                
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LandingPage()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
