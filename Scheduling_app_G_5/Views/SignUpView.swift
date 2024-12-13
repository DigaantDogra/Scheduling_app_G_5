    //
    //  SignUpView.swift
    //  Scheduling_app_G_5
    //
    //  Created by Youssef Abdelhamid on 2024-12-11.
    //

    import SwiftUI

    struct SignUpView: View {
        @Environment(\.presentationMode) var presentationMode
        @State private var name: String = ""
        @State private var companyName: String = ""
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""
        @State private var selectedRole: UserType? = nil
        @State private var accountCreated: Bool = false // New state to track if signup is complete
//        @State private var navigateToContentView = false // Bind to control navigation


        var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    if accountCreated {
                        // Display this after account creation (Last thing user will see)
                        Text("Account Created. Login")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                            .padding(.bottom, 40)
                    
//                        NavigationLink(destination: LandingPage(), isActive: $navigateToContentView) {
//                            EmptyView() // Invisible, just controls navigation
//                        }
                        
                        BasicButton(text: "Login") {
                            presentationMode.wrappedValue.dismiss() // Trigger navigation when tapped
                        }

                    }
                    //User Role Select (The first thing user sees on this page)
                    else if selectedRole == nil {
                        Text("What type of user are you?")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                            .padding(.bottom, 40)
                        
                        // RoleButtons
                        RoleButton(role: .employer, action: { selectedRole = .Employer })
                        RoleButton(role: .manager, action: { selectedRole = .Manager })
                        RoleButton(role: .associate, action: { selectedRole = .Associate })
                        
                        Spacer()
                    } else {
                        // Account Creation (Second Thing User will see after picking role)
                        // Create account title
                        Text("Create a \(selectedRole!) Account")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                            .padding(.bottom, 40)
                        
                        // Back to Role Chooser
                        HStack {
                            Button {
                                selectedRole = nil
                            }label: {
                                Text("Change Role")
                                    .frame(width: 100, height: 25, alignment: .center)
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                                    .background(Color.purple)
                                    .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
                                    .clipShape(.rect(cornerRadius: 5))
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        // Email TextField
                        TextField("", text: $name)
                            .foregroundStyle(.black)
                            .textFieldStyle(.plain)
                            .placeholder(when: name.isEmpty) {
                                Text("Name")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        
                        // UI Splitter
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.black)
                        
                        TextField("", text: $companyName)
                            .foregroundStyle(.black)
                            .textFieldStyle(.plain)
                            .placeholder(when: companyName.isEmpty) {
                                Text("Company Name")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        
                        // UI Splitter
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.black)
                        
                        TextField("", text: $email)
                            .foregroundStyle(.black)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        
                        // UI Splitter
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.black)
                        
                        // Password TextField
                        SecureField("", text: $password)
                            .foregroundStyle(.black)
                            .textFieldStyle(.plain)
                            .placeholder(when: password.isEmpty) {
                                Text("Password")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        
                        // Sign Up Button
                        BasicButton(text: "Sign Up") {
                            // Simulate account creation
                            accountCreated = true
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
            }
        }
    }

    #Preview {
        SignUpView()
    }
