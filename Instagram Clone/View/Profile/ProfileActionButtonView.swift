//
//  ProfileActionButtonView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showEditProfile = false
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    
    //MARK: - BODY
    var body: some View {
        
        if viewModel.user.isCurrentUser {
            // edite profile Button
            Button(action: {
                showEditProfile = true
            }, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
        }) // Button
            .sheet(isPresented: $showEditProfile) {
                EditProfileView(user: $viewModel.user)
            }
        } else {
            // follow and message Button
            HStack {
                
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0)
                        )
                }) // Button
                .cornerRadius(isFollowed ? 5 : 0)
                
                Button(action: {
                    
                }, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                }) // Button
                
            } // HStack
        }
    }
}

