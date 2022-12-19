//
//  CustomInputfieldView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 16..
//

import SwiftUI

struct CustomInputFieldView: View {
    @Binding var text: String
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))

                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }

            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFieldView(text: .constant(""), imageName: "envelope", placeholderText: "Email", isSecureField: false)
    }
}
