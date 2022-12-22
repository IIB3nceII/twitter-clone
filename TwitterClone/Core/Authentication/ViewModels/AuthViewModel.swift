//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import Firebase
import FirebaseFirestore
import Foundation
import UIKit

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()

    init() {
        self.userSession = Auth.auth().currentUser
        fetchUser()
    }

    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to sign in, \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            self.userSession = user
            self.didAuthenticateUser = true
        }
    }

    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed with \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            self.tempUserSession = user

            let data = ["email": email, "userName": userName.lowercased(), "fullName": fullName, "uid": user.uid]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }

    func signOut() {
        userSession = nil
        didAuthenticateUser = false
        try? Auth.auth().signOut()
    }

    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }

        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }

    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
