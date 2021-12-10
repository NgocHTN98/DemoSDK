//
//  ItemChoosePackageView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class ItemChoosePackageView: UIView {
    lazy var viewBody: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var lbPackage: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Super 30"
        return lb
    }()
    lazy var iconRight: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "chevron.down")
        return img
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.addSubview(self.viewBody)
        self.viewBody.addSubview(lbPackage)
        self.viewBody.addSubview(self.iconRight)
        NSLayoutConstraint.activate([
            self.viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.viewBody.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lbPackage.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 14),
            self.lbPackage.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 15),
            self.lbPackage.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -15),
            self.lbPackage.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -15),
            self.iconRight.heightAnchor.constraint(equalToConstant: 5.25),
            self.iconRight.widthAnchor.constraint(equalToConstant: 10.5),
            self.iconRight.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -17),
            self.iconRight.centerYAnchor.constraint(equalTo: self.viewBody.centerYAnchor)
        ])
        self.viewBody.layer.cornerRadius = 8
        self.viewBody.backgroundColor = UIColor(hexString: "#F9FBFF")
    }
}
