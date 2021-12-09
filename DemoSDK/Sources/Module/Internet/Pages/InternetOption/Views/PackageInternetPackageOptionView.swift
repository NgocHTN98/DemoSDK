//
//  PackageInternetPackageOptionView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class PackageInternetPackageOptionView: UIView {
    private lazy var stackView: UIStackView = {
        let s = UIStackView()
        return s
    }()
    var navigationPage: (() -> Void)? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupUI() {
        self.stackView.axis = .vertical
        self.stackView.distribution = .fillProportionally
        self.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
      
    }
    
    func addItemSubView(contents: [ItemPackageInternetOptionModel]) {
        self.setupUI()
        if contents.count > 0{
            contents.forEach { s in
                let v = ItemPackageInternetOptionView()
//                v.navigationPage = navigationPage
                v.translatesAutoresizingMaskIntoConstraints = false
                v.iconPackage.image = s.iconPakage
                self.stackView.addArrangedSubview(v)
            }
        }
       
    }
}
