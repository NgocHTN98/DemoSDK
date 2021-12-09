//
//  NavigationBarView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 09/11/2021.
//

import Foundation
import UIKit
protocol NavigationBarDelegate {
    func tapViewOption()
}
class NavigationBarView: UIView {
    //MARK: Property
    lazy var viewBody: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgBack: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "leftButtonBar")
        img.tintColor = UIColor.white
        return img
    }()
    lazy var title: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(hexString: "#FFFFFF")
        return lb
    }()
    lazy var stackViewRight: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .fillProportionally
        return s
    }()
    let heightNavigationBar: CGFloat = 50
     var safeAreaTopHeight: CGFloat  {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets.top + heightNavigationBar
        }
        return heightNavigationBar
    }
    
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "dots 1")
        return i
    }()
    var delegate: NavigationBarDelegate?
    weak var vcMain: UIViewController?
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
        self.addSubview(viewBody)
        self.viewBody.addSubview(self.imgBack)
        self.imgBack.translatesAutoresizingMaskIntoConstraints = false
        self.viewBody.translatesAutoresizingMaskIntoConstraints = false
        imgBack.isUserInteractionEnabled = true
       
        NSLayoutConstraint.activate([
            self.viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBody.topAnchor.constraint(equalTo: self.topAnchor),
            self.imgBack.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 18),
            self.imgBack.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -18),
            self.imgBack.heightAnchor.constraint(equalToConstant: 24),
            self.imgBack.widthAnchor.constraint(equalToConstant: 24)
            
        ])
        self.imgBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBack)))
        addViewOptionRight()
    }
    
   
    func setTitle(_ title: String, alignment: NSTextAlignment = .center, font: UIFont? = nil) {
        self.title.text = title
        if font != nil {
            self.title.font = font
        }
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.viewBody.addSubview(self.title)
        if alignment == .left {
            NSLayoutConstraint.activate([
                self.title.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor),
                self.title.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -18)
            ])
        }else {
            NSLayoutConstraint.activate([
                self.title.centerXAnchor.constraint(equalTo: self.viewBody.centerXAnchor),
                self.title.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -18)
            ])
        }
        
    }
    
    func addViewOptionRight() {
        setUpViewRight()
        self.viewRight.translatesAutoresizingMaskIntoConstraints = false
        self.imgRight.translatesAutoresizingMaskIntoConstraints = false
        self.viewRight.addSubview(imgRight)
        NSLayoutConstraint.activate([
            imgRight.heightAnchor.constraint(equalToConstant: 24),
            imgRight.widthAnchor.constraint(equalToConstant: 24),
            imgRight.leadingAnchor.constraint(equalTo: self.viewRight.leadingAnchor, constant: 6),
            imgRight.trailingAnchor.constraint(equalTo: self.viewRight.trailingAnchor, constant: -6),
            imgRight.topAnchor.constraint(equalTo: self.viewRight.topAnchor, constant: 6),
            imgRight.bottomAnchor.constraint(equalTo: self.viewRight.bottomAnchor, constant: -6),
        ])
        self.stackViewRight.addArrangedSubview(viewRight)
        self.viewRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewDot)))
    }
    
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        delegate?.tapViewOption()
    }
    
    func addViewRight(viewRight: [UIView]) {
        viewRight.forEach { v in
            self.stackViewRight.addArrangedSubview(v)
        }
    }
    func setUpViewRight() {
        self.viewBody.addSubview(self.stackViewRight)
        self.stackViewRight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackViewRight.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -16),
            self.stackViewRight.bottomAnchor.constraint(equalTo: self.viewBody.bottomAnchor, constant: -18),
        ])
      
    }
    
    @objc func tapBack(_ sender: UITapGestureRecognizer) {
        print("go back")
//        goBack()
    }
    
//    func goBack() {
//        guard let vc = vcMain else { return }
//        if !vc.isModal {
//            vc.navigationController?.popViewController(animated: true)
//        }
//        else {
//            vc.dismiss(animated: true, completion: nil)
//        }
//    }
    
    func setGradientsBackgroundColor(_ colors: [UIColor]) {
        if colors.count > 0 {
            if let colorFirst = colors.first, let colorLast = colors.last {
//                let arrColor = [colorFirst.cgColor, colorLast.cgColor]
//                self.viewBody.gradientBackground(colors: arrColor, direction: .topToBottom)
            }
        }
    }
    
    func setBackgroundColor(_ colors: UIColor) {
        viewBody.backgroundColor = colors
        self.backgroundColor = colors
    }
    
}
