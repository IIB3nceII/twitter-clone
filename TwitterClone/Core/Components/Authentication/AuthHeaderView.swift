//
//  AuthenticationHeader.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import SwiftUI

struct AuthHeaderView: View {
    let title: String
    let subTitle: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(subTitle)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthenticationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Hello.", subTitle: "Welcome back")
    }
}
