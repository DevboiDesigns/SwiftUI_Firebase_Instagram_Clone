//
//  NotificationsView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0 ..< 20) { item in
                    NotificationCell()
                }
            }
        } //ScrollView
        .padding(.top)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
