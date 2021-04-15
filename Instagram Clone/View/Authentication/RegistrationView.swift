//
//  RegistrationView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/15/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.viewfinder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                        //.offset(y: -20)
                }).padding(.top, 20)
                
                VStack(spacing: 20) {
                    // Email
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // Username
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // Full Name
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // Password
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                
                // Sign In BUTTON
                
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                })
                .padding()
                .padding(.top, 20)
                
                // go to Sign Up link
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView(),
                    label: {
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
                    }) // Nav Link
                    .padding(.bottom, 20)
                
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
