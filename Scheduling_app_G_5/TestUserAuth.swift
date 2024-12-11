//
//  TestUserAuth.swift
//  Scheduling_app_G_5
//
//  Created by Digaant Dogra on 2024-12-01.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct TestUserAuth: View {
    let vm = TestViewModel()
    @State var email = ""
    @State var password = ""
    @State var userIsLoggedIn = false
    
    var body: some View {
        Group{
            if userIsLoggedIn{
                content
            }else{
                TestDisplay()
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { _, user in
                self.userIsLoggedIn = (user != nil) // Update state based on user presence
            }
        }
    }
    
    var content:some View{
        VStack(alignment: .center) {
            Text("Login Test")
                .font(.title)
                .padding()
            
            Group{
                TextField("Email",text: $email)
                    .foregroundColor(Color.black)
                Rectangle()
                    .frame(width: 350,height: 1)
                
                SecureField("Password",text: $password)
                Rectangle()
                    .frame(width: 350,height: 1)
                
                HStack {
                    Button {
                        register()
                        print("Successful R")
                    }label: {
                        Text("Sign-In")
                            .font(.title2)
                            .padding(16)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(.capsule)
                    }
                    .padding()
                    
                    Button {
                        login()
                        print("Successful L")
                    }label: {
                        Text("Log-In")
                            .font(.title2)
                            .padding(16)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(.capsule)
                    }
                    .padding()
                }
                
            }
            .padding(.horizontal,30)
            
            
        }
        
    }
    
    // Functions
    
    private func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }else{
                vm.addEmployer(for: Employer(email: email, password: password, empName: "Arjun", empID: 2, company: Company(companyName: "Ok", companyID: 4)))
            }
        }
    }
    
    private func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
}

#Preview {
    TestUserAuth()
}
