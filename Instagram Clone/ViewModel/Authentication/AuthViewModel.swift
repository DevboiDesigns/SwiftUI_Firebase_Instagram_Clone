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
    
    static let shared = AuthViewModel()
    
    
    init() {
        userSession = Auth.auth().currentUser
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
        }
    }
    
    //MARK: - REGISTER
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
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
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("Succesully uploaded user Data ....")
                    self.userSession = user
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
    func resetPassword() {
        
    }
    
    //MARK: - FETCH USER
    func fetchUser() {
        
    }
}
