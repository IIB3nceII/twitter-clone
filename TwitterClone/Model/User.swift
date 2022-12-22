//
//  User.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 22..
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName: String
    let fullName: String
    let profileImageUrl: String
    let email: String
}
