//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import Firebase
import SwiftUI

@main
struct TwitterCloneApp: App {
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                // ContentView()
                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}
