//
//  MonthlyPackageView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class MonthlyPackageView: UIView {
    private lazy var stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 8
        return s
    }()
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#E8E8E8")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var isSelectedTag: Int = 0 {
        didSet {
            stackView.subviews.forEach { v in
                let view = v as? ItemMonthlyPackageView
                if isSelectedTag == view?.iconRight.tag  {
                    view?.iconRight.image = UIImage(named: "record.circle")
                    view?.iconRight.tintColor = UIColor(hexString: "#4564ED")
                }
                else {
                    view?.iconRight.image = UIImage(named: "circle")
                    view?.iconRight.tintColor = UIColor(hexString: "#AAAAAA")
                }
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupUI() {
       
        self.addSubview(self.stackView)
        self.addSubview(self.line)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            self.line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.line.heightAnchor.constraint(equalToConstant: 1)
        ])
      
    }
    
    func addItemSubView(contents: [String] = ["1", "2", "3"]) {
        self.setupUI()
        if contents.count > 0{
            for index in 0...contents.count - 1 {
                let v = ItemMonthlyPackageView()
                v.translatesAutoresizingMaskIntoConstraints = false
                v.iconRight.tintColor = UIColor(hexString: "#AAAAAA")
                v.iconRight.tag = index
                if index == 0 {
                    v.iconRight.image = UIImage(named: "record.circle")
                    v.iconRight.tintColor = UIColor(hexString: "#4564ED")
                }
                v.iconRight.isUserInteractionEnabled = true
                v.iconRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImageButton)))
                self.stackView.addArrangedSubview(v)
            }
        }
       
    }
    @objc func tapImageButton(_ sender: UITapGestureRecognizer) {
        self.isSelectedTag = sender.view?.tag ?? -1
        //if select tag = 0 as btn con lại = false
        print("item tap \(sender.view?.tag ?? 0)")
    }
    
}
