//
//  UIView+Extensions.swift
//  DemoSDK
//
//  Created by TaiHA on 10/12/2021.
//

import Foundation
enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
}
extension UIView {
    func gradientBackground(colors: [CGColor], direction: GradientDirection, cornerRadius: CGFloat = 0) {
           let gradient = CAGradientLayer()
           gradient.frame = self.bounds
           gradient.colors = colors
           gradient.cornerRadius = cornerRadius
           switch direction {
           case .leftToRight:
               gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
               gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
           case .rightToLeft:
               gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
               gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
           case .bottomToTop:
               gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
               gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
           default:
               break
           }
           
           self.layer.insertSublayer(gradient, at: 0)
       }
}
