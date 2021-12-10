//
//  ServiceAttachmentView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class ServiceAttachmentView: UIView {
    lazy var viewBody: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "F-Safe Online an toàn"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        return lb
    }()
    lazy var lbMonthly: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Miễn phí dùng thử 2 tháng"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#767676")
        return lb
    }()
   
    lazy var iconRight: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "checkmark.square.fill")
        img.tintColor = UIColor(hexString: "#4564ED")
        img.layer.opacity = 0.5
        return img
    }()
    lazy var viewFSafe: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var iconInfo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_circle_info_blue")
        return img
    }()
    lazy var titleFSafe: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Tìm hiểu về F-Safe"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#4564ED")
        return lb
    }()
    lazy var viewContentFSafe: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var showPopup: (() -> Void)? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupUI() {
        self.addSubview(self.viewBody)
        self.viewBody.layer.cornerRadius = 8
        self.viewBody.layer.borderWidth = 1
        self.viewBody.layer.borderColor = UIColor(hexString: "#4564ED").cgColor
        self.viewFSafe.backgroundColor = UIColor(hexString: "#89A7FE").withAlphaComponent(0.05)
        self.viewBody.addSubview(lbTitle)
        self.viewBody.addSubview(lbMonthly)
        self.viewBody.addSubview(self.iconRight)
        self.viewBody.addSubview(viewFSafe)
        viewFSafe.addSubview(self.viewContentFSafe)
        self.viewContentFSafe.addSubview(self.iconInfo)
        self.viewContentFSafe.addSubview(self.titleFSafe)
        self.viewFSafe.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            self.viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.viewBody.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            self.lbTitle.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 12),
            self.lbTitle.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 16),
            
            self.lbMonthly.topAnchor.constraint(equalTo: self.lbTitle.bottomAnchor),
            self.lbMonthly.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 16),
            
            self.iconRight.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -16),
            self.iconRight.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 22),
            self.iconRight.widthAnchor.constraint(equalToConstant: 24),
            self.iconRight.heightAnchor.constraint(equalToConstant: 24),
            
            self.viewFSafe.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 16),
            self.viewFSafe.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -16),
            self.viewFSafe.topAnchor.constraint(equalTo: self.lbMonthly.bottomAnchor, constant: 10),
            self.viewFSafe.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -12),
            
            self.viewContentFSafe.centerXAnchor.constraint(equalTo: self.viewFSafe.centerXAnchor),
            self.viewContentFSafe.topAnchor.constraint(equalTo: self.viewFSafe.topAnchor, constant: 3),
            self.viewContentFSafe.bottomAnchor.constraint(equalTo: self.viewFSafe.bottomAnchor, constant: -3),

            self.iconInfo.heightAnchor.constraint(equalToConstant: 14),
            self.iconInfo.widthAnchor.constraint(equalToConstant: 14),
            self.iconInfo.centerYAnchor.constraint(equalTo: self.viewContentFSafe.centerYAnchor),
            self.iconInfo.leadingAnchor.constraint(equalTo: self.viewContentFSafe.leadingAnchor),
            
            self.titleFSafe.leadingAnchor.constraint(equalTo: self.iconInfo.trailingAnchor, constant: 8),
            self.titleFSafe.topAnchor.constraint(equalTo: self.viewContentFSafe.topAnchor),
            self.titleFSafe.bottomAnchor.constraint(equalTo: self.viewContentFSafe.bottomAnchor),
            self.titleFSafe.trailingAnchor.constraint(equalTo: self.viewContentFSafe.trailingAnchor),
        ])
        
        self.viewFSafe.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapShowPopupFSafe)))
    }
    
    @objc func tapShowPopupFSafe(_ sender: UITapGestureRecognizer) {
        self.showPopup?()
    }
}
