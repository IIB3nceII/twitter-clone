//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var exploreViewModel = ExploreViewModel()

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(exploreViewModel.users) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
