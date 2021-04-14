//
//  UserCell.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // image
            Image("LakesideLogo")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                // user name
                Text("John")
                    .font(.system(size: 14, weight: .semibold))
                
                // full name
                Text("Lakeside Colegio")
                    .font(.system(size: 14))
            }
            Spacer()
        } // HStack
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
