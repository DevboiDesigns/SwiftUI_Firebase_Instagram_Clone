//
//  User.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/19/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}