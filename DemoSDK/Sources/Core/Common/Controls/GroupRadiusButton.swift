//
//  GroupRadiusButton.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class GroupRadiusButton: UIView {
    lazy var sBody: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 25
        s.distribution = .fill
        return s
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    var isSelectedTag: Int = 0 {
        didSet {
            sBody.subviews.forEach { v in
                let btn = v as? RadiusButton
                if isSelectedTag == btn?.iconButton.tag  {
                    btn?.iconButton.image = UIImage(named: "ic_circle_checked_v1")
                    btn?.iconButton.tintColor = UIColor(hexString: "#4564ED")
                }
                else {
                    btn?.iconButton.image = UIImage(named: "ic-shape-select-off")
                    btn?.iconButton.tintColor = UIColor(hexString: "#AAAAAA")
                }
            }
        }
    }
    func setupUI() {
        self.addSubview(sBody)
        sBody.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.sBody.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sBody.topAnchor.constraint(equalTo: self.topAnchor),
            self.sBody.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor),
            self.sBody.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    func addSubButton(data: [String] = ["Nam", "Nữ"]) {
        if data.count > 0 {
            for index in 0...data.count - 1 {
                let btnRadius = RadiusButton()
                
                btnRadius.lbTitle.text = data[index]
                btnRadius.iconButton.tintColor = UIColor(hexString: "#AAAAAA")
                btnRadius.iconButton.tag = index
                
                if index == 0 {
                    btnRadius.iconButton.image = UIImage(named: "ic_circle_checked_v1")
                    btnRadius.iconButton.tintColor = UIColor(hexString: "#4564ED")
                }
                btnRadius.iconButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImageButton)))
                self.sBody.addArrangedSubview(btnRadius)
            }
            
        }
    }
    @objc func tapImageButton(_ sender: UITapGestureRecognizer) {
        self.isSelectedTag = sender.view?.tag ?? -1
        //if select tag = 0 as btn con lại = false
        print("item tap \(sender.view?.tag ?? 0)")
    }
    
}
