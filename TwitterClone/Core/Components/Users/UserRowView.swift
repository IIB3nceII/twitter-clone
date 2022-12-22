//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import Kingfisher
import SwiftUI

struct UserRowView: View {
    let user: User

    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: 4) {
                Text(user.userName)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text(user.fullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
