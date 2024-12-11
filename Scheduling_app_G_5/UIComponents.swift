//
//  UIComponents.swift
//  Scheduling_app_G_5
//
//  Created by Youssef Abdelhamid on 2024-12-11.
//

import SwiftUI
import SwiftUI

// MARK: - RoleButton
struct RoleButton: View {
    let role: UserRole
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(role.rawValue)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(
                    LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
        }
    }
}

// Enum for user roles (if used widely, consider putting it in a separate file)
enum UserRole: String {
    case student = "Student"
    case professor = "Professor"
    case employee = "Employee"
}

// MARK: - CustomTextField
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, 5)
    }
}

// MARK: - CustomSecureField
struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        SecureField(placeholder, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, 5)
    }
}

struct BasicButton: View {
    var text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(
                    LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
        }
    }
}




