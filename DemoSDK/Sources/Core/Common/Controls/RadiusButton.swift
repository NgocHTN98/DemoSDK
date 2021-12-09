//
//  RadiusButton.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class RadiusButton: UIView {
    lazy var iconButton: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ic-shape-select-off")
        return img
    }()
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Nam"
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
        self.addSubview(self.iconButton)
        self.addSubview(self.lbTitle)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        iconButton.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            iconButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconButton.widthAnchor.constraint(equalToConstant: 24),
            iconButton.heightAnchor.constraint(equalToConstant: 24),
            iconButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            lbTitle.leadingAnchor.constraint(equalTo: iconButton.trailingAnchor, constant: 8),
            lbTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor)
        ])
       
    }
    
   
}
