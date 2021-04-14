//
//  FeedCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image("ETP_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("English a tu Puerta")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }
            .padding([.leading, .bottom], 8)
            
            // post Image
            Image("text_content")
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
            
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("English a la Puerta")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                + Text(" se enorgullece de colaborar con Lakeside para proveer talleres interactivos, divertidos y de calidad para los alumnos de Lakeside.")
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

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
