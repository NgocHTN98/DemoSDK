//
//  UITextField+Extensions.swift
//  DemoSDK
//
//  Created by TaiHA on 10/12/2021.
//

import Foundation
extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
           get {
               return self.placeHolderColor
           }
           set {
               self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
           }
       }
}
