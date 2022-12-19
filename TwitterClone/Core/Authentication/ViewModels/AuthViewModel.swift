//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import Firebase
import FirebaseFirestore
import Foundation

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?

    init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(withEmail email: String, password: String) {
        print("Login with \(email)")
    }

    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed with \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            self.userSession = user

            print("Registered user successfully!\(self.userSession)")

            let data = ["email": email, "userName": userName.lowercased(), "fullName": fullName, "uid": user.uid]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("User date uploaded")
                }
        }
    }

    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
