//
//  Spacer.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation
import UIKit
class Spacer: UIView {
    lazy var viewChild = UIView()
    init(_ height: CGFloat = 0, _ leading: CGFloat = 0, _ trailing: CGFloat = 0, _ bottom: CGFloat = 0, _ top: CGFloat = 0) {
        super.init(frame: .zero)
        setupUI(height)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI(_ height: CGFloat = 0, _ leading: CGFloat = 0, _ trailing: CGFloat = 0, _ bottom: CGFloat = 0, _ top: CGFloat = 0) {
        self.addSubview(viewChild)
        self.viewChild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.viewChild.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leading),
            self.viewChild.topAnchor.constraint(equalTo: self.topAnchor, constant: top),
            self.viewChild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: trailing),
            self.viewChild.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom),
            self.viewChild.heightAnchor.constraint(equalToConstant: height)
        ])
       
    }
    
}
