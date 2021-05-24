//
//  FeedCellViewModel.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/24/21.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])  // ---- TO UPDATE DATA ON BACKEND 
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
        print("Like Post")
    }
    
    func unlike() {
        print("Unlike Post")
    }
    
    func checkIfUserLikedPost() {
        
    }
}
