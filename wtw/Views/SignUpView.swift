//
//  SignUpView.swift
//  wtw
//
//  Created by lordpoo on 11/12/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .padding(.top, 100)
            
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.words)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Sign Up") {
                // Action to perform sign up
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
            
            NavigationLink("Already have an account? Sign In", destination: LoginView())
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .navigationBarHidden(true)
    }
}


#Preview {
    SignUpView()
}
