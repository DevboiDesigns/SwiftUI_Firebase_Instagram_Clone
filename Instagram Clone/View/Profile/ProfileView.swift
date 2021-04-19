//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
