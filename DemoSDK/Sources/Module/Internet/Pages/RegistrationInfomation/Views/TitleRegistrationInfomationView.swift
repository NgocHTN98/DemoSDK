//
//  TitleRegistrationInfomationView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class TitleRegistrationInfomationView: UIView {
    lazy var iconLeft: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ic_person_blue")
        return img
    }()
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Thông tin đăng ký"
        lb.textColor = .black
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.addSubview(iconLeft)
        self.addSubview(lbTitle)
        
        
        self.iconLeft.translatesAutoresizingMaskIntoConstraints = false
        self.lbTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.iconLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            self.iconLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.iconLeft.widthAnchor.constraint(equalToConstant: 24),
            self.iconLeft.heightAnchor.constraint(equalToConstant: 24),
            self.iconLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            lbTitle.leadingAnchor.constraint(equalTo: self.iconLeft.trailingAnchor, constant: 8),
            lbTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 19)
        ])
    }
}
