//
//  ProfileHeaderView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                

                HStack(alignment: .firstTextBaseline, spacing: 12) {
                    // Entire view will not show until values load
                    
//                    if let stats = viewModel.user.stats {
//                        UserStatView(value: stats.posts, title: "Post")
//                        UserStatView(value: stats.followers, title: "Followers")
//                        UserStatView(value: stats.following, title: "Following")
//                    }
                    
                    // OR
                    // will show default 0 values until loads
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Post")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                    
                    
                }
                .padding(.trailing, 20)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.user.fullname)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.leading, 20)
                
                Text("CEO English A Tu Puerta | Travel Consultant")
                    .font(.system(size: 15))
                    .padding(.leading, 20)
            }
            
            HStack {
                Spacer()

                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            
            
        } // VStack
    }
}


