//
//  TextFieldValidateView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class TextFieldValidateView: UIView {
    
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(hexString: "#AAAAAA")
        return lb
    }()
    lazy var lbSignStar: UILabel = {
        let lb = UILabel()
        lb.text = "*"
        lb.textColor = UIColor(hexString: "#E5625C")
        return lb
    }()
    
    lazy var boderTextField: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(hexString: "#AAAAAA").cgColor
        v.layer.cornerRadius = 8
        return v
    }()
    lazy var textField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    lazy var lbValidate: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(hexString: "#E5625C")
        return lb
    }()
    
    var heightConstraint: NSLayoutConstraint?
    var isvalidate: Bool = false {
        didSet {
            if isvalidate {
                lbValidate.isHidden = true
                self.heightConstraint?.constant = 0
            }
            else {
                lbValidate.isHidden = false
                self.heightConstraint?.constant = -(self.lbValidate.bounds.height + 8)
                
            }
            self.boderTextField.setNeedsUpdateConstraints()
        }
    }
    
    init(model: TextFieldValidateModel) {
        super.init(frame: .zero)
        setupUI()
        setupData(model: model)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
       
        self.addSubview(lbTitle)
        self.addSubview(lbSignStar)
        self.lbTitle.translatesAutoresizingMaskIntoConstraints = false
        self.lbSignStar.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.boderTextField)
        self.boderTextField.addSubview(self.textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.boderTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.lbValidate)
        self.lbValidate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.lbTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.lbSignStar.leadingAnchor.constraint(equalTo: self.lbTitle.trailingAnchor),
            self.lbSignStar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            self.boderTextField.topAnchor.constraint(equalTo: self.lbTitle.bottomAnchor, constant: 8),
            self.boderTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.boderTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.textField.leadingAnchor.constraint(equalTo: self.boderTextField.leadingAnchor, constant: 14),
            self.textField.trailingAnchor.constraint(equalTo: self.boderTextField.trailingAnchor, constant: -14),
            self.textField.topAnchor.constraint(equalTo: self.boderTextField.topAnchor, constant: 15),
            self.textField.bottomAnchor.constraint(equalTo: self.boderTextField.bottomAnchor, constant: -13),
            
            self.lbValidate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.lbValidate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            self.lbValidate.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
        heightConstraint = self.boderTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        heightConstraint?.isActive = true
        self.lbValidate.isHidden = true
    }
    
    func setupData(model: TextFieldValidateModel?) {
        guard let vm = model else { return }
        lbTitle.text = vm.title
        lbValidate.text = vm.titleValidate
        textField.placeholder = vm.placeholder
        lbSignStar.isHidden = !(vm.isRequire ?? true)
    }
}
struct TextFieldValidateModel {
    let placeholder: String?
    let isRequire: Bool? = true
    let title: String?
    let titleValidate: String?
}
