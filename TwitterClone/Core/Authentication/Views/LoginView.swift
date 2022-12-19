//
//  LoginView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            AuthHeaderView(title: "Hello.", subTitle: "Welcome back")

            VStack(spacing: 40) {
                CustomInputFieldView(text: $email, imageName: "envelope", placeholderText: "Email")
                CustomInputFieldView(text: $password, imageName: "lock", placeholderText: "Password")
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)

            HStack {
                Spacer()

                NavigationLink {
                    Text("Reset Pass")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }

            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .gray.opacity(0.5), radius: 100, x: 0, y: 0)
            }

            Spacer()

            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)

                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
