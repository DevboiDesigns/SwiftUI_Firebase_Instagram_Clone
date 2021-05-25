//
//  CustomInputView.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 5/24/21.
//

import SwiftUI

struct CustomInputView: View {
    //MARK: - PROPERTIES
    @Binding var inputText: String
    
    var action: () -> Void
    // Custom Action for reusable View
    
    //MARK: - BODY
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            // send button
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
            .padding(.bottom, 8)
            .padding(.horizontal, 20)
        }
        
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""))
//    }
//}
