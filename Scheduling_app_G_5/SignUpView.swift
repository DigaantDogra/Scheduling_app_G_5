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
    @State private var selectedRole: UserRole? = nil

    
    var body: some View {
        VStack(spacing: 20) {
            if selectedRole == nil {
                Text("What type of user are you?")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    .padding(.bottom,40)
                //RoleButtons
                RoleButton(role: .student, action: { selectedRole = .student })
                RoleButton(role: .professor, action: { selectedRole = .professor })
                RoleButton(role: .employee, action: { selectedRole = .employee })

                Spacer()
            }else{
                //Options after Role Selection
                Text("Create a \(selectedRole!.rawValue) Account")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    .padding(.bottom,40)
                
                HStack {
                    Button("Change Role"){
                        selectedRole = nil
                    }
                    .frame(width: 100, height: 25, alignment: .center)
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
                    .background(Color.purple)
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                TextField("", text: $email)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
                            .bold()
                    }

                BasicButton(text:"Sign Up"){
                    
                }
                
                Spacer()

            }
            
            

            
        }
        .padding(.horizontal, 30)
        .padding(.top, 50)
    }
}

#Preview {
    SignUpView()
}
