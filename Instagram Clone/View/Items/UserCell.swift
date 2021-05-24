//
//  UserCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            // image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                // user name
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                // full name
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            Spacer()
        } // HStack
    }
}

