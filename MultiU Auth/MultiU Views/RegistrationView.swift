//
//  RegistrationView.swift
//  MultiU Auth
//
//  Created by Inspect V on 29/04/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isRegistrationSuccess = false // Track registration status
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text("MultiU Authentication")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 20)

            Text("Register Now")
                .font(.title)
                .foregroundColor(.gray) // Change headline color to grey
                .padding(.bottom, 10) // Make registration headline smaller

            VStack(alignment: .leading, spacing: 10) {
                Text("Username")
                    .font(.headline)
                    .foregroundColor(Color.gray) // Change headline color to grey
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Email")
                    .font(.headline)
                    .foregroundColor(Color.gray) // Change headline color to grey
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Password")
                    .font(.headline)
                    .foregroundColor(Color.gray) // Change headline color to grey
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Confirm Password")
                    .font(.headline)
                    .foregroundColor(Color.gray) // Change headline color to grey
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            .background(Color.gray.opacity(0.1)) // Use light grey background color

            Button(action: {
                if containsSpecialCharacter(password) {
                    isRegistrationSuccess = true
                } else {
                    errorMessage = "Password must contain at least 1 special character"
                    resetFields()
                }
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.darkGreen) // Change button color to green
                    .cornerRadius(5)
            }
            .padding()

            Spacer()

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .alert(isPresented: $isRegistrationSuccess) {
            Alert(title: Text("Successful"), message: Text("Registration successful"), dismissButton: .default(Text("OK")))
        }
    }

    private func containsSpecialCharacter(_ string: String) -> Bool {
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+\\|[]{};:'\",.<>/?")
        return string.rangeOfCharacter(from: specialCharacterSet) != nil
    }

    private func resetFields() {
        username = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
