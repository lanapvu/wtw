//
//  LoginView.swift
//  wtw
//
//  Created by lordpoo on 11/12/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.green)
                    .padding(.top, 100)
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Please sign in to continue")
                    .font(.body)
                    .foregroundColor(.gray)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Forgot password?") {
                    // Action to reset password
                }
                .foregroundColor(.green)
                .padding(.trailing, 10)
                .alignmentGuide(.trailing) { d in d[.trailing] }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button("Sign In") {
                    // Action to perform login
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
                
                NavigationLink("Don't have an account? Sign Up", destination: SignUpView())
                    .foregroundColor(.green)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
