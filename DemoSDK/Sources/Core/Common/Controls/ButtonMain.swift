//
//  ButtonMain.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 01/11/2021.
//

import Foundation
import UIKit
class ButtonMain: AppButton {
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 8
        
//        backgroundColor = UIColor(named: "disable_button")
        self.titleLabel?.textColor = UIColor.white
        setTitleColor(UIColor.white, for: .normal)
        
    }
    override func SetHeightButton(height: CGFloat) {
        super.SetHeightButton(height: height)
    }
    override var isEnabled: Bool {
        
        didSet {
            if (isEnabled) {
//                self.titleLabel?.textColor = UIColor(named: "app_color")
                backgroundColor = UIColor.blue
                setTitleColor(UIColor.white, for: .disabled)
                
            } else {
                setTitleColor(UIColor.white, for: .disabled)
//                self.titleLabel?.textColor = UIColor(named: "app_color")
//                backgroundColor = UIColor(named: "disable_button")
            }
        }
    }

          
}
