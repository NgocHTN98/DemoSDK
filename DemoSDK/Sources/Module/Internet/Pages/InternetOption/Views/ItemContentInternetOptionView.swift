//
//  ItemInternetOptionView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 17/11/2021.
//

import Foundation
import UIKit
class ItemContentInternetOptionView: UIView {
    var content: String? {
        didSet {
            lbContent.text = content
        }
    }
    lazy var img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "checkmark")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
   
    lazy var lbContent: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 0
        return lb
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.addSubview(self.img)
        self.addSubview(self.lbContent)
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            img.widthAnchor.constraint(equalToConstant: 16),
            img.heightAnchor.constraint(equalToConstant: 12),
            img.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lbContent.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 16),
            lbContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            lbContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            lbContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
}
