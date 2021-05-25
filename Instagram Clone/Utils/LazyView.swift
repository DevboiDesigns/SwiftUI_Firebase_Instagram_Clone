//
//  LazyView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/25/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
    
}



// will take another view ex. LazyView(ProfileView(user: user) and will only load that view and api calls when called upon/clicked
