//
//  Extensions.swift
//  Instagram Clone
//
//  Created by Christopher Hicks on 4/14/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
