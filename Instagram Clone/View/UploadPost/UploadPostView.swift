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
                    
                    TextField("Enter your caption..", text: $captionText)
                }
                .padding()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                })
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

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
