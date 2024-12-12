//
//  WelcomePage.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI

struct WelcomePage: View {
    @State private var compID: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error:String = ""
    @Binding var isUserLoggedIn:Bool
    @Binding var user:User?
    let vm = WelcomeViewModel()
//    @State var employer
    
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
                    
                    TextField("", text: $compID)
                        .foregroundStyle(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: compID.isEmpty){
                            Text("Company ID")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    TextField("", text: $email)
                        .autocapitalization(.none)
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
                    
                    Button{
                        vm.login(for: email, password: password){user in
                            if let user = user {
                                        // Update the login state only after the login function succeeds
                                        DispatchQueue.main.async {
                                            self.user = user
                                            isUserLoggedIn = true
                                        }
                                    } else {
                                        error = "Login failed or user not found"
                                    }
                        }
                    }label: {
                        Text("Login")//use button for auth
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(.linearGradient(colors: [.indigo], startPoint: .center, endPoint: .zero)))
                        .foregroundStyle(.white)
                    }
                    
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
                    
                    Text("\(error)")
                        .foregroundColor(.red)
                    
//                    Button("Forgot Password"){
//                    }.foregroundStyle(.white)
                    
                }
                .frame(width: 350)
                
                
            }
            .ignoresSafeArea()
        }
    }
    
    //Functions
    
}

#Preview {
//    WelcomePage(isUserLoggedIn: .constant(false), user: .constant(Associate(email: "test@test.com", password: "1234567", associateName: "Test", associateID: 0, company: Company(companyName: "Company", companyID: 0), associateSchedule: <#T##[Schedule]#>, associateAvaliability: <#T##_#>)))
    WelcomePage(isUserLoggedIn: .constant(false), user: .constant(Manager(email: "mtest@test.com", password: "1234567", managerName: "MTest", managerID: 0, company: Company(companyName: "Company", companyID: 0))))
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

