//
//  ItemPackageInternetOptionView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class ItemPackageInternetOptionView: UIView {
    lazy var viewBody: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var iconPackage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "avatar_blue")
        return img
    }()
    lazy var viewContent: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var iconArrow: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "chevron.right")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = UIColor(hexString: "#282828")
        return img
    }()
    lazy var lbPackage: UILabel = {
       let lb = UILabel()
        lb.text = "Combo Super30"
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.textColor = UIColor(hexString: "#2F3954")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var lbMonth: UILabel = {
       let lb = UILabel()
        lb.text = "300.000đ/tháng"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#FF7E07")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var lbSpeed: UILabel = {
       let lb = UILabel()
        lb.text = "Download/Upload: 30Mpbs"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#767676")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#E8E8E8")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    var navigationPage: (() -> Void)? = nil
    func setupUI() {
        self.addSubview(viewBody)
        self.viewBody.addSubview(self.iconPackage)
        self.viewBody.addSubview(self.viewContent)
        self.viewBody.addSubview(self.iconArrow)
        self.viewContent.addSubview(self.lbPackage)
        self.viewContent.addSubview(self.lbMonth)
        self.viewContent.addSubview(self.lbSpeed)
        self.viewBody.addSubview(self.line)
        self.iconPackage.layer.cornerRadius = 8
        self.iconPackage.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBody.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            self.iconPackage.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor),
            self.iconPackage.heightAnchor.constraint(equalToConstant: 48),
            self.iconPackage.widthAnchor.constraint(equalToConstant: 48),
            self.iconPackage.centerYAnchor.constraint(equalTo: self.viewBody.centerYAnchor),
            
            self.viewContent.leadingAnchor.constraint(equalTo: self.iconPackage.trailingAnchor, constant: 16),
            self.viewContent.topAnchor.constraint(equalTo: self.viewBody.topAnchor),
            self.viewContent.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor),

            self.iconArrow.centerYAnchor.constraint(equalTo: self.viewBody.centerYAnchor),
            self.iconArrow.leadingAnchor.constraint(greaterThanOrEqualTo: self.viewContent.trailingAnchor, constant: 20),
            self.iconArrow.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor),
            self.iconArrow.heightAnchor.constraint(equalToConstant: 10),
            self.iconArrow.widthAnchor.constraint(equalToConstant: 5.7),
            
            self.lbPackage.topAnchor.constraint(equalTo: self.viewContent.topAnchor, constant: 16),
            self.lbPackage.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor),
            self.lbPackage.trailingAnchor.constraint(equalTo: self.viewContent.trailingAnchor),
            
            self.lbMonth.topAnchor.constraint(equalTo: self.lbPackage.bottomAnchor, constant: 4),
            self.lbMonth.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor),
            self.lbMonth.trailingAnchor.constraint(equalTo: self.viewContent.trailingAnchor),
            
            self.lbSpeed.topAnchor.constraint(equalTo: self.lbMonth.bottomAnchor, constant: 4),
            self.lbSpeed.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor),
            self.lbSpeed.trailingAnchor.constraint(equalTo: self.viewContent.trailingAnchor),
            self.lbSpeed.bottomAnchor.constraint(equalTo: self.viewContent.bottomAnchor, constant: -16),
            
            self.line.heightAnchor.constraint(equalToConstant: 1),
            self.line.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor),
            self.line.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor),
            self.line.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor)
        ])
        
        self.viewBody.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewBody)))
    }
    @objc func tapViewBody(_ sender: UITapGestureRecognizer) {
        self.navigationPage?()
    }
}
struct ItemPackageInternetOptionModel {
    let iconPakage: UIImage?
}
