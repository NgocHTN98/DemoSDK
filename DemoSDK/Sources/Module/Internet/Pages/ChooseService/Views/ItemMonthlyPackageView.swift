//
//  ItemMonthlyPackageView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class ItemMonthlyPackageView: UIView {
    lazy var viewBody: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var viewLeft: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var lbPackage: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Gói 1 tháng"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        return lb
    }()
    lazy var lbInstallCost: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Miễn phí lắp đặt 300.000đ/tháng"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#767676")
        return lb
    }()
    lazy var lbMonthlyPackage: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cước hàng tháng: 300.000đ"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(hexString: "#767676")
        return lb
    }()
    lazy var iconRight: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_uncheck_circle_gray")
        img.tintColor = UIColor(hexString: "#4564ED")
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
        self.viewBody.layer.cornerRadius = 8
        self.viewBody.backgroundColor = UIColor(hexString: "#89A7FE").withAlphaComponent(0.05)
        self.viewBody.addSubview(viewLeft)
        viewLeft.addSubview(lbPackage)
        viewLeft.addSubview(lbInstallCost)
        self.viewBody.addSubview(self.iconRight)
        NSLayoutConstraint.activate([
            self.viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.viewBody.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.viewLeft.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 12),
            self.viewLeft.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 16),
            self.viewLeft.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -12),
                        
            self.lbPackage.topAnchor.constraint(equalTo: self.viewLeft.topAnchor),
            self.lbPackage.leadingAnchor.constraint(equalTo: self.viewLeft.leadingAnchor),
            self.lbPackage.trailingAnchor.constraint(equalTo: self.viewLeft.trailingAnchor),

            self.lbInstallCost.topAnchor.constraint(equalTo: self.lbPackage.bottomAnchor),
            self.lbInstallCost.leadingAnchor.constraint(equalTo: self.viewLeft.leadingAnchor),
            self.lbInstallCost.trailingAnchor.constraint(equalTo: self.viewLeft.trailingAnchor),
            self.lbInstallCost.bottomAnchor.constraint(equalTo: self.viewLeft.bottomAnchor),

            self.iconRight.widthAnchor.constraint(equalToConstant: 24),
            self.iconRight.heightAnchor.constraint(equalToConstant: 24),
            self.iconRight.leadingAnchor.constraint(equalTo: self.viewLeft.trailingAnchor, constant: 5),
            self.iconRight.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -16),
            self.iconRight.centerYAnchor.constraint(equalTo: self.viewBody.centerYAnchor),
            
          
        ])
    }
}
