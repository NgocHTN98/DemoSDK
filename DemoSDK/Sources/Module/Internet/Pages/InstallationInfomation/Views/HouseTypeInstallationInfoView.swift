//
//  HouseTypeInstallationInfoView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation
import UIKit
class HouseTypeInstallationInfoView: UIView {
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Loại nhà"
        lb.textColor = UIColor(hexString: "#AAAAAA")
        return lb
    }()
    lazy var lbSignStar: UILabel = {
        let lb = UILabel()
        lb.text = "*"
        lb.textColor = UIColor(hexString: "#E5625C")
        return lb
    }()
    
    lazy var radiusButton = GroupRadiusButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.addSubview(self.lbTitle)
        self.addSubview(self.lbSignStar)
        self.addSubview(self.radiusButton)
        
        self.lbSignStar.translatesAutoresizingMaskIntoConstraints = false
        self.lbTitle.translatesAutoresizingMaskIntoConstraints = false
        self.radiusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.lbTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.lbSignStar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            self.lbSignStar.leadingAnchor.constraint(equalTo: self.lbTitle.trailingAnchor),
         
            self.radiusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.radiusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.radiusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.radiusButton.topAnchor.constraint(equalTo: self.lbTitle.bottomAnchor, constant: 8),
        ])
        let data: [String] = ["Nhà riêng", "Chung cư"]
        self.radiusButton.addSubButton(data: data)
    }
}
