//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 15..
//

import Kingfisher
import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullName)
                            .font(.headline)

                        Text("@\(user.userName)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)

                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }

                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
