//
//  LogInView.swift
//  MultiU Auth
//
//  Created by Inspect V on 27/04/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccess = false // Track login status
    @State private var isInvalidCredentials = false // Track invalid credentials

    var body: some View {
        NavigationView {
            VStack {
                Text("MultiU Authenticator")
                    .font(.title)
                    .foregroundColor(.lightGrey) // Light grey color
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.lightGrey) // Light grey color
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.lightGrey) // Light grey color
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                Button(action: {
                    // Handle login button tapped event
                    // For demonstration purposes, assume the login is successful
                    // Replace this with your actual authentication logic

                    if email == "student@nci.ie" && password == "nci?123" {
                        // If login is successful, navigate to TwoFactorAuthView
                        isLoginSuccess = true
                    } else {
                        // If login fails, set flag for invalid credentials
                        isInvalidCredentials = true
                    }
                }) {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darkGreen) // Define dark green color
                        .cornerRadius(5)
                }
                .padding()

                NavigationLink(destination: RegistrationView()) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darkGreen) // Define dark green color
                        .cornerRadius(5)
                }
                .padding(.bottom)
            }
            .background(Color.darkGrey) // Define dark grey color
            .sheet(isPresented: $isLoginSuccess) {
                TwoFactorAuthView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire window
        .alert(isPresented: $isInvalidCredentials) {
            Alert(title: Text("Invalid Credentials"), message: Text("Please check your email and password"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension Color {
    static let darkGreen = Color(red: 0, green: 0.5, blue: 0)
    static let darkGrey = Color(red: 0.2, green: 0.2, blue: 0.2) // Dark grey color
    static let lightGrey = Color(red: 0.8, green: 0.8, blue: 0.8) // Light grey color
}
