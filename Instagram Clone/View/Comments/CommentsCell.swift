//
//  CommentsCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/24/21.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    //MARK: - PROPERTIES
    let comment: Comment
    
    
    //MARK: - BODY
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
                Text(" \(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
               
                
        }.padding(.horizontal)
    }
}

//struct CommentsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsCell()
//    }
//}
