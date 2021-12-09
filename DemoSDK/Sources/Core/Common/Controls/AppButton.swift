//
//  AppButton.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 01/11/2021.
//

import Foundation
import UIKit
class AppButton: UIButton {
    
    var constraintHeight : NSLayoutConstraint?
    var constraintWidth : NSLayoutConstraint?
    func SetHeightButton(height: CGFloat) {
        
        if(constraintHeight != nil){
            self.removeConstraint(constraintHeight!)
        }
        
        constraintHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        
        guard let constraintHeight = constraintHeight else{
            return
        }
        
        self.addConstraints([constraintHeight])
    }
    
    func SetWidthButton(width: CGFloat) {
        
        if(constraintWidth != nil){
            self.removeConstraint(constraintWidth!)
        }
        
        constraintWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: width)
        
        guard let constraintWidth = constraintWidth else{
            return
        }
        
        self.addConstraints([constraintWidth])
    }
    
    
    
}
