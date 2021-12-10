//
//  RegistrationInfomationViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class RegistrationInfomationViewController: UIViewController {
    @IBOutlet weak var heihgtnavigationView: NSLayoutConstraint!
    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var btnContinue: ButtonMain!
    @IBOutlet weak var sBody: UIStackView!
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    var viewModel = RegistrationInfomationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        setupUIViewRight()
        self.navigationBarView.setTitle("Thông tin đăng ký")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setBackgroundColor(UIColor(hexString: "#4564ED"))
        self.heihgtnavigationView.constant = navigationBarView.safeAreaTopHeight
        self.viewShadow.layer.shadowColor = UIColor.black.cgColor
        self.viewShadow.layer.cornerRadius = 12
        self.viewShadow.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewShadow.layer.shadowOpacity = 0.2
        self.viewFooter.layer.cornerRadius = 18
        viewShadow.backgroundColor = UIColor.white
        viewFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.btnContinue.isEnabled = true
        btnContinue.addTarget(self, action: #selector(tapButtonContinue), for: .touchUpInside)
    }
    
    func setupUIViewRight() {
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
        
        self.viewRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewDot)))
    }
    
    func setupData() {
        if viewModel.data.count > 0 {
            viewModel.data.forEach({ v in
                switch v {
                case .title(let view):
                    return sBody.addArrangedSubview(view)
                case .textField(let view):
                    return sBody.addArrangedSubview(view)
                case .gender(let view):
                    return sBody.addArrangedSubview(view)
                }
            })
        }
    
        self.viewShadow.layoutIfNeeded()
        
        
    }
    
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        print("tap image dot inside navigationbar")
    }
    @objc func tapButtonContinue(_ sender: UIButton) {
        validateAllTextFile()
        print("tap image dot inside navigationbar")
    }
    
    func validateAllTextFile() {
        sBody.subviews.forEach({ v in
            let view = v as? TextFieldValidateView
            view?.isvalidate = !(view?.textField.text?.isEmpty ?? true)
        })
    }
}
