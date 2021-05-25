//
//  NotificationsViewModel.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/24/21.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotification() {
        
    }
    // static: dont have to initialize every time to acces function anwhere you need
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }

        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()), "username": user.username, "uid": user.id ?? "", "profileImageUrl": user.profileImageUrl, "type": type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
