//
//  FeedCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text(post.ownerUsername)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }
            .padding([.leading, .bottom], 8)
            
            // post Image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            // action buttons
            HStack(spacing: 16) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
            } // HStack
            .foregroundColor(.black)
            .accentColor(.black)
            .padding(.leading, 4)
            
            
            // caption
            
            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(post.ownerUsername)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    + Text(" \(post.caption)")
                    .font(.system(size: 15))
            } //HStack
            .padding(.horizontal, 8)  // horizontal= leading and trailing
            
            
            // time stamp
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 1)
        } // VStack
//        .padding(.bottom, 10)
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//            .previewLayout(.sizeThatFits)
//            //.padding()
//    }
//}
