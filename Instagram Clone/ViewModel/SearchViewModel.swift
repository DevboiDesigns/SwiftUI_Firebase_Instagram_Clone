//
//  SearchViewModel.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/19/21.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
       
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
                                        // $0 represents each data
            // LONG HAND Version
//            documents.forEach { snapshot in
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            
            //print(self.users)
        }
    }
    
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
    
}
