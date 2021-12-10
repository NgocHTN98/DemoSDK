//
//  ContentSuperView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 24/11/2021.
//

import Foundation
import UIKit
class ContentSuperView: UIView {
    //MARK: Property
    lazy var iconLeft: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "checkmark.shield.fill")
        img.tintColor = UIColor(hexString: "#30D78B")
        return img
    }()
    lazy var lbContent: UILabel = {
       let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        lb.textColor = UIColor(hexString: "#2F3954")
        lb.text = "Thiết bị modem mặc định: AC1000C version 2/AC1000F"
        return lb
    }()
    //MARK:Function
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.addSubview(iconLeft)
        self.addSubview(lbContent)
        iconLeft.translatesAutoresizingMaskIntoConstraints = false
        lbContent.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.iconLeft.widthAnchor.constraint(equalToConstant: 24),
            self.iconLeft.heightAnchor.constraint(equalToConstant: 24),
            self.iconLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.iconLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.lbContent.leadingAnchor.constraint(equalTo: self.iconLeft.trailingAnchor, constant: 12),
            self.lbContent.topAnchor.constraint(equalTo: self.topAnchor),
            self.lbContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lbContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
