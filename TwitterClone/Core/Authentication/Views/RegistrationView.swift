//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack {
                //            NavigationLink(destination: ProfilePhotoSelectorView(),
                //                           isActive: $viewModel.didAuthenticateUser,
                //                           label: {})
                
                AuthHeaderView(title: "Get started", subTitle: "Create your account")
                
                VStack(spacing: 40) {
                    CustomInputFieldView(text: $email, imageName: "envelope", placeholderText: "Email")
                    CustomInputFieldView(text: $userName, imageName: "person", placeholderText: "User name")
                    CustomInputFieldView(text: $fullName, imageName: "person", placeholderText: "Full name")
                    CustomInputFieldView(text: $password, imageName: "lock", placeholderText: "Password", isSecureField: true)
                }
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullName: fullName, userName: userName)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 100, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
