//
//  CommentsView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/24/21.
//

import SwiftUI

struct CommentsView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: CommentViewModel
    @State var commentText = ""
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)
                            
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView()
//    }
//}
