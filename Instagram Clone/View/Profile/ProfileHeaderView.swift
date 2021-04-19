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
                

                HStack(alignment: .center, spacing: 16) {
                    
                    UserStatView(value: 22, title: "Post")
                    UserStatView(value: 1111, title: "Followers")
                    UserStatView(value: 696, title: "Following")
                }
                .padding(.trailing, 10)
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


