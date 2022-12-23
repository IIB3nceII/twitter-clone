//
//  NewTweetViewModel.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 23..
//

import Foundation

class NewTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()

    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {}
        }
    }
}
