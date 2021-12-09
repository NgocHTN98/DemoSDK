//
//  InternetOptionContentView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 17/11/2021.
//

import Foundation
import UIKit
class InternetOptionContentView: UIView {
    lazy var stackView: UIStackView = {
        let s = UIStackView()
        return s
    }()
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#E8E8E8")
        return v
    }()
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
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.line.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line)
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            self.line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.line.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.line.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.line.heightAnchor.constraint(equalToConstant: 1),
        ])
      
    }
    func addItemSubView(contents: [String]) {
        self.setupUI()
        if contents.count > 0{
            contents.forEach { s in
                let v = ItemContentInternetOptionView()
                v.translatesAutoresizingMaskIntoConstraints = false
                v.content = s
                self.stackView.addArrangedSubview(v)
            }
        }
       
    }
    
}
