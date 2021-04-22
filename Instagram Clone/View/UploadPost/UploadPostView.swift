//
//  UploadPostView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImages: UIImage?  // UIKit
    @State private var postImage: Image?   // SwiftUI
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()   // Button toggles true/ false for imagePickerPresented
                }, label: {
                    Image(systemName: "plus.viewfinder")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.gray)
                }) // Button
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImages)  // presents a Sheet or Modale View
                })
                
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
//                    TextField("Enter your caption..", text: $captionText)
                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                }
                .padding()
                
                HStack(spacing: 16) {
                    Button(action: {
                        if let image = selectedImages {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    }, label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color(.systemBlue))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
        
                    
                    Button(action: {
                        captionText = ""
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color(.systemRed))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                    
                } // HStack
                .padding()
                
       
            }
            Spacer()
        } // VStack
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImages else { return }
        postImage = Image(uiImage: selectedImage)
    }
}


