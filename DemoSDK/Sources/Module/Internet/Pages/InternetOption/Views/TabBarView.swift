//
//  TabBarView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 10/11/2021.
//

import Foundation
import UIKit

class TabBarView: UIView {
    //MARK: Property
    lazy var viewBody: UIView = {
        let v = UIView()
        return v
    }()
    lazy var viewCombo: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 91, height: 91))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var viewOnly: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imageCombo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "person")
        img.tintColor = UIColor.white
        return img
    }()
    lazy var imageOnly: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ic_building_white")
        return img
    }()
    lazy var lbCombo: UILabel = {
        let l = UILabel()
        l.text = "Internet Cá nhân"
        l.font = UIFont.systemFont(ofSize: 12)
//        l.textColor = UIColor(named: "app_color")
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    lazy var lbOnly: UILabel = {
        let l = UILabel()
        l.text = "Internet Doanh nghiệp"
        l.font = UIFont.systemFont(ofSize: 12)
//        l.textColor = UIColor(named: "app_color")
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    enum TypeTabBar {
        case combo
        case only
    }
    let selectedColors = [UIColor(hexString: "#7C93FC").cgColor, UIColor(hexString: "#4564ED").cgColor]
    var selectedItemTabBar: TypeTabBar = .only {
        didSet {
            if selectedItemTabBar == .combo {
                self.imageCombo.image = UIImage(named: "person.fill")
                self.imageOnly.image = UIImage(named: "ic_building_white")
//                self.viewCombo.gradientBackground(colors: selectedColors, direction: .topToBottom, cornerRadius: 8)
                self.viewOnly.layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
            } else {
                self.imageCombo.image = UIImage(named: "person")
                self.imageOnly.image = UIImage(named: "ic_building_fill_white")
//                self.viewOnly.gradientBackground(colors: selectedColors, direction: .topToBottom, cornerRadius: 8)
                self.viewCombo.layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
               
            }
        }
    }
    //MARK: Function
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        self.viewOnly.translatesAutoresizingMaskIntoConstraints = false
        self.viewBody.translatesAutoresizingMaskIntoConstraints = false
        self.imageCombo.translatesAutoresizingMaskIntoConstraints = false
        self.imageOnly.translatesAutoresizingMaskIntoConstraints = false
        self.lbCombo.translatesAutoresizingMaskIntoConstraints = false
        self.lbOnly.translatesAutoresizingMaskIntoConstraints = false
       
        viewCombo.layer.cornerRadius = 8
        viewOnly.layer.cornerRadius = 8
        self.addSubview(self.viewBody)
        self.viewBody.addSubview(viewCombo)
        self.viewBody.addSubview(viewOnly)
        self.viewCombo.addSubview(imageCombo)
        self.viewCombo.addSubview(lbCombo)
        self.viewOnly.addSubview(imageOnly)
        self.viewOnly.addSubview(lbOnly)
        self.backgroundColor = UIColor(hexString: "#4564ED")
        NSLayoutConstraint.activate([
            self.viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.viewBody.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            
            self.viewCombo.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 0),
            self.viewCombo.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 5),
            self.viewCombo.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: 0),
            self.viewCombo.widthAnchor.constraint(equalToConstant: 91),
            
            self.viewOnly.leadingAnchor.constraint(equalTo: self.viewCombo.trailingAnchor),
            self.viewOnly.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 5),
            self.viewOnly.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: 0),
            self.viewOnly.widthAnchor.constraint(equalToConstant: 91),
            
            self.imageCombo.topAnchor.constraint(equalTo: self.viewCombo.topAnchor, constant: 9),
            self.imageCombo.centerXAnchor.constraint(equalTo: self.viewCombo.centerXAnchor),
            self.imageCombo.heightAnchor.constraint(equalToConstant: 32),
            self.imageCombo.widthAnchor.constraint(equalToConstant: 32),
            self.lbCombo.leadingAnchor.constraint(equalTo: self.viewCombo.leadingAnchor),
            self.lbCombo.trailingAnchor.constraint(equalTo: self.viewCombo.trailingAnchor),
            self.lbCombo.topAnchor.constraint(equalTo: self.imageCombo.bottomAnchor, constant: 0),
            self.lbCombo.bottomAnchor.constraint(equalTo: self.viewCombo.bottomAnchor, constant: -8),

            self.imageOnly.topAnchor.constraint(equalTo: self.viewOnly.topAnchor, constant: 9),
            self.imageOnly.centerXAnchor.constraint(equalTo: self.viewOnly.centerXAnchor),
            self.lbOnly.leadingAnchor.constraint(equalTo: self.viewOnly.leadingAnchor),
            self.lbOnly.trailingAnchor.constraint(equalTo: self.viewOnly.trailingAnchor),
            self.lbOnly.topAnchor.constraint(equalTo: self.imageOnly.bottomAnchor, constant: 9),
            self.lbOnly.bottomAnchor.constraint(equalTo: self.viewOnly.bottomAnchor, constant: -8)
            
        ])
        self.selectedItemTabBar = .combo
        self.viewCombo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapItemComboView)))
        self.viewOnly.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapItemOnlyView)))
        
    }
    
    @objc func tapItemComboView(_ sender: UITapGestureRecognizer) {
        self.selectedItemTabBar = .combo
    }
    
    @objc func tapItemOnlyView(_ sender: UITapGestureRecognizer) {
        self.selectedItemTabBar = .only
    }
    
}

