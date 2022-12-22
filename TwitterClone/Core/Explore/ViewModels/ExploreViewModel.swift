//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 22..
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
