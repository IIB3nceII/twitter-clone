//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 22..
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""

    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercaseQuery = searchText.lowercased()

            return users.filter {
                $0.userName.lowercased().contains(lowercaseQuery) ||
                    $0.fullName.lowercased().contains(lowercaseQuery)
            }
        }
    }

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
