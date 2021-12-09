//
//  DropListView.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 02/12/2021.
//

import Foundation
import UIKit
@IBDesignable
class DropListView: UIView {
   
    lazy var textField: UITextField = {
        let tf = UITextField()
       
        return tf
    }()
    lazy var iconRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "chevron.down")
        i.tintColor = UIColor(hexString: "#000000")
        return i
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    override func prepareForInterfaceBuilder() {
           super.prepareForInterfaceBuilder()
        self.setupUI()
       }
    @IBInspectable var placeholder: String? = "" {
        willSet(p) {
            textField.placeholder = p
//            textField.placeHolderColor = UIColor(hexString: "#232323")
        }
    }

    func setupUI() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor(hexString: "#F9FBFF")
        self.addSubview(textField)
        self.addSubview(iconRight)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.iconRight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.iconRight.widthAnchor.constraint(equalToConstant: 18),
            self.iconRight.heightAnchor.constraint(equalToConstant: 18),
            self.iconRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
            self.iconRight.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.iconRight.leadingAnchor.constraint(greaterThanOrEqualTo: self.textField.trailingAnchor, constant: 12)
        ])
        
    }
}
