//
//  NotificationsView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct NotificationsView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel = NotificationsViewModel()
    
    //MARK: - BODY
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                        .padding(.top)
                }
            }
        } //ScrollView
        
    }
}


