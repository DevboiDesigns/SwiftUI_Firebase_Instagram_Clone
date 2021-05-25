//
//  AuthViewModel.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/18/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink = false
    
    static let shared = AuthViewModel()
    
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    //MARK: - LOGIN
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    //MARK: - REGISTER
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("Succesully registered user ....")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Succesully uploaded user Data ....")
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    //MARK: - SIGN OUT
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    //MARK: - RESET PASSWORD
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed to reset password \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true 
        }
        
    }
    
    //MARK: - FETCH USER
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user 
        }
    }
}
