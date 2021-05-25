//
//  NotificationCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = false
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var body: some View {
        
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        + Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15)) +
                        Text(" \(viewModel.timestampString)")
                        .foregroundColor(.gray).font(.system(size: 12))
                        
                }
            }
            
            
            Spacer()
            
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped() // ---- clip to frame 
                    }
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 75, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0)
                        )
                })
            }
        }
        .padding(.horizontal)
    }
}

