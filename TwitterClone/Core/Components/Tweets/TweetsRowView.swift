//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import Kingfisher
import SwiftUI

struct TweetsRowView: View {
    let tweet: Tweet

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                if let image = tweet.user?.profileImageUrl {
                    KFImage(URL(string: image))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())

                } else {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.systemBlue))
                }

                VStack(alignment: .leading, spacing: 4) {
                    if let user = tweet.user {
                        HStack {
                            Text(user.fullName)
                                .font(.subheadline).bold()

                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }

                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }

            HStack {
                Button {} label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)

            Divider()
        }
        .padding()
    }
}
