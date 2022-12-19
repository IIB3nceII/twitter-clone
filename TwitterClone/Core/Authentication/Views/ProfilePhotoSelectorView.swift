//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 19..
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?

    var body: some View {
        VStack {
            AuthHeaderView(title: "Create your account", subTitle: "Add a profile photo")

            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        .clipShape(Circle())
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }

            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
