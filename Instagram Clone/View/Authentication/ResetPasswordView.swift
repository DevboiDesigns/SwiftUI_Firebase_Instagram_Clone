//
//  ResetPasswordView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/15/21.
//

import SwiftUI

struct ResetPasswordView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    
    
    @Binding private var email: String
    //MARK: - how to bind 2 different Text Fields to each other
    init(email: Binding<String>) {
        self._email = email
    }
    
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("Instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100, alignment: .center)
                    .padding(.bottom, 20)
                    .offset(y: -50)
                
                VStack(spacing: 20) {
                    // Email
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    
                    // Reset
                    
                    Button(action: {
                        viewModel.resetPassword(withEmail: email)
                    }, label: {
                        Text("Reset Password")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .clipShape(Capsule())
                    })
                    .padding()
                    
                    // go to Sign Up link
                    
                    Spacer()
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                            
                        }
                        .foregroundColor(.white)
                    })
                    .padding(.bottom, 20)
                    
                }
            }
        }
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}
//struct ResetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}
