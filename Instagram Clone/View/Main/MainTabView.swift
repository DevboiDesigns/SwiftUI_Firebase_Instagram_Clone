//
//  MainTabView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture(perform: {
                        selectedIndex = 0
                    })
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture(perform: {
                        selectedIndex = 1
                    })
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture(perform: {
                        selectedIndex = 2
                    })
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                NotificationsView()
                    .onTapGesture(perform: {
                        selectedIndex = 3
                    })
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture(perform: {
                        selectedIndex = 4
                    })
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
        } // NavView
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
        }

    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notification"
        case 4: return "Profile"
        default: return ""
        }
    }
}


