//
//  Tweet.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 23..
//

import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var user: User?
}
