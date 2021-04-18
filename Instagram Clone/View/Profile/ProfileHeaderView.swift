//
//  ProfileHeaderView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ETP_logo")
                    .resizable()
                    .scaledToFit()
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
                Text("Chris Sc")
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.leading, 20)
                
                Text("CEO English A Tu Puerta | Travel Consultant")
                    .font(.system(size: 15))
                    .padding(.leading, 20)
            }
            
            HStack {
                Spacer()

                ProfileActionButtonView()
                
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            
            
        } // VStack
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}