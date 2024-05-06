//
//  TwoFactorAuthView.swift
//  MultiU Auth
//
//  Created by Inspect V on 29/04/2024.
//
import SwiftUI

struct TwoFactorAuthView: View {
    @State private var authenticatorCode: String = ""
    @State private var searchText: String = ""
    @State private var showAlert = false // Track whether to show the alert

    var body: some View {
        VStack {
            Text("Get 2FA Code")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            TextField("Enter API Private key", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Enter API Secret key", text: $authenticatorCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Call a function to generate the 2FA code
                generate2FACode()
            }) {
                Text("Get 2FA Code")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.darkGreen)
                    .cornerRadius(5)
            }
            .padding()
        }
        .padding()
        .background(Color.darkGrey)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Generated Code"), message: Text("MultiU-Personal: \(authenticatorCode)"), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            if showAlert {
                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
                    showAlert = false
                }
            }
        }
    }

    func generate2FACode() {
        // Simulate generating a 2FA code
        // In a real app, this would involve making a network request to the 2FA service provider
        authenticatorCode = "203661" // Example code, replace with actual implementation
        showAlert = true // Show the alert with the generated code
    }
}

struct TwoFactorAuthView_Previews: PreviewProvider {
    static var previews: some View {
        TwoFactorAuthView()
    }
}
