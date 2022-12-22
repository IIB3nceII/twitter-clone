//
//  UserService.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 22..
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapShot, _ in
                guard let snapShot = snapShot else { return }
                guard let user = try? snapShot.data(as: User.self) else { return }
                completion(user)
            }
    }

    func fetchUsers(completion: @escaping ([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap { try? $0.data(as: User.self) }
                completion(users)
            }
    }
}
