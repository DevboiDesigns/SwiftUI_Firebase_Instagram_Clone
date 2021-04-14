//
//  FeedView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            //MARK: - loads only what is insight, helps with memory - LazyVStack
            LazyVStack(spacing: 32) {
                ForEach(0 ..< 10) { _ in
                    FeedCell()
                }
            } // LazyVStack
            .padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
