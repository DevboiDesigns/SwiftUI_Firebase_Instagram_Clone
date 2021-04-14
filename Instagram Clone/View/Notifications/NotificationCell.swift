//
//  NotificationCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    
    var body: some View {
        
        HStack {
            Image("ETP_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("English a la Puerta")
                .font(.system(size: 14))
                .fontWeight(.semibold)
            + Text(" liked one of your posts.")
                .font(.system(size: 15))
            
            
            Spacer()
            
            
            if showPostImage {
                Image("flyer_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {
                    
                }, label: {
                    Text("Follow")
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray2))
                        .accentColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
            
            
            
            
            
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
            .previewLayout(.sizeThatFits)
    }
}
