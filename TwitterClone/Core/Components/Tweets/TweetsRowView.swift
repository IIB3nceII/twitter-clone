//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 14..
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()

                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)

                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }

                    Text("ndljnljdnf;b;adknbfdnanbfnbkfmdbadnf sandlj f ndas jndsajn d;;sn;sa nas ndd jasnsj!")
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
        }
        .padding()
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
