//
//  EditProfileView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/25/21.
//

import SwiftUI

struct EditProfileView: View {
    //MARK: - PROPERTIES
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @Binding var user: User
    @State private var bioText: String
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Button(action: {
                    viewModel.saveUserData(bioText)
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Done")
                        .bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.25)
                .padding()
            
            Spacer()
            
            
        }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.user.bio = viewModel.user.bio
            }
        })
    }
    
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
