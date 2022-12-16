//
//  CustomInputfieldView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import SwiftUI

struct CustomInputfieldView: View {
    @Binding var text: String
    let imageName: String
    let placeholderText: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))

                TextField(placeholderText, text: $text)
            }

            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputfieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputfieldView(text: .constant(""), imageName: "envelope", placeholderText: "Email")
    }
}
