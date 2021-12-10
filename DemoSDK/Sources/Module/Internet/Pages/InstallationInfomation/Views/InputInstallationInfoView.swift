//
//  InputInstallationInfoView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation
import UIKit
class InputInstallationInfoView: UIView {
    lazy var bodyView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#F9FBFF")
        v.layer.cornerRadius = 8
        return v
    }()
    lazy var tfContent: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Is null or empty"
        tf.placeHolderColor = UIColor(hexString: "#171717")
        return tf
    }()
    lazy var lbValidate: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(hexString: "#E5625C")
        return lb
    }()
    lazy var iconRight: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "chevron.down")
        icon.tintColor = UIColor(hexString: "#000000")
        return icon
    }()
    var heightConstraint: NSLayoutConstraint?
    var isValidate: Bool = false {
        didSet {
            if isValidate {
                lbValidate.isHidden = true
                self.heightConstraint?.constant = 0
            }
            else {
                lbValidate.isHidden = false
                self.heightConstraint?.constant = -(self.lbValidate.bounds.height + 8)
                
            }
            self.setNeedsUpdateConstraints()
        }
    }
    var event: InputInstallationInfoEvent?
    init(model: InputInstallationInfoViewModel?) {
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
        self.addSubview(self.bodyView)
        self.bodyView.addSubview(tfContent)
        self.bodyView.addSubview(iconRight)
        self.addSubview(self.lbValidate)
        self.bodyView.translatesAutoresizingMaskIntoConstraints = false
        self.tfContent.translatesAutoresizingMaskIntoConstraints = false
        self.iconRight.translatesAutoresizingMaskIntoConstraints = false
        self.lbValidate.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            self.bodyView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.bodyView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.bodyView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            
            self.tfContent.leadingAnchor.constraint(equalTo: self.bodyView.leadingAnchor, constant: 14),
            self.tfContent.topAnchor.constraint(equalTo: self.bodyView.topAnchor, constant: 15),
            self.tfContent.bottomAnchor.constraint(equalTo: self.bodyView.bottomAnchor, constant: -15),
            
            iconRight.widthAnchor.constraint(equalToConstant: 18),
            iconRight.heightAnchor.constraint(equalToConstant: 18),
            iconRight.trailingAnchor.constraint(equalTo: self.bodyView.trailingAnchor, constant: -14),
            iconRight.leadingAnchor.constraint(equalTo: self.tfContent.trailingAnchor, constant: 8),
            iconRight.centerYAnchor.constraint(equalTo: self.bodyView.centerYAnchor),
            
            self.lbValidate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.lbValidate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            self.lbValidate.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
        
        heightConstraint = self.bodyView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        heightConstraint?.isActive = true
        self.lbValidate.isHidden = true
        self.bodyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapItem)))
     
    }
    
    func setupData(model: InputInstallationInfoViewModel?) {
        guard let vm = model else { return }
        tfContent.placeholder = vm.placeholder
        lbValidate.text = vm.titleValidate
        
    }
    @objc func tapItem(_ sender: UITapGestureRecognizer)
    {
        self.event?.navigationPage?()
    }
}
struct InputInstallationInfoViewModel {
    let placeholder: String?
    let titleValidate: String?
}
struct InputInstallationInfoEvent {
    var navigationPage: (() -> ())? = nil
}
