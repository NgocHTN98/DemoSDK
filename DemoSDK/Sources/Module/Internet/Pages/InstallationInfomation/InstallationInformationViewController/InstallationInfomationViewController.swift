//
//  InstallationInfomationViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation
import UIKit
class InstallationInfomationViewController: UIViewController{
   
    @IBOutlet weak var heightNavigationView: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: NavigationBarView!
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    @IBOutlet weak var viewAddress: UIView!
    
    @IBOutlet weak var stackAddress: UIStackView!
    @IBOutlet weak var viewTime: UIView!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var viewHour: UIView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var btnContinue: ButtonMain!
    var viewModel = InstallationInfomationViewModel()
    //MARK: Function
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        setupUI()
        setupData()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        setupUIViewRight()
        self.navigationBarView.setTitle("Thông tin đăng ký")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setBackgroundColor(UIColor(hexString: "#4564ED"))
        heightNavigationView.constant = navigationBarView.safeAreaTopHeight
        //Add icon right to navigation bar
        
        //Shadow view address
        self.viewAddress.layer.shadowColor = UIColor.black.cgColor
        self.viewAddress.layer.cornerRadius = 12
        self.viewAddress.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewAddress.layer.shadowOpacity = 0.2
        //Shadow view time
        self.viewTime.layer.shadowColor = UIColor.black.cgColor
        self.viewTime.layer.cornerRadius = 12
        self.viewTime.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewTime.layer.shadowOpacity = 0.2
        
        self.viewDate.layer.cornerRadius = 8
        self.viewDate.layer.borderWidth = 1
        self.viewDate.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        self.viewHour.layer.cornerRadius = 8
        self.viewHour.layer.borderWidth = 1
        self.viewHour.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        //shadow view footer
        self.viewFooter.layer.cornerRadius = 18
        viewFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.btnContinue.isEnabled = true
        self.btnContinue.addTarget(self, action: #selector(tapButtonContinue), for: .touchUpInside)
        
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
    
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        print("tap image dot inside navigationbar")
    }
    
    func setupData() {
        if viewModel.data.count > 0 {
            viewModel.data.forEach({ v in
                switch v {
                case .title(let view):
                    return stackAddress.addArrangedSubview(view)
                case .input(let view, let ev):
                    view.event = ev
                    view.tfContent.isEnabled = false
                    stackAddress.addArrangedSubview(view)
                    return
                    
                case .houseType(let view):
                    return stackAddress.addArrangedSubview(view)
                case .inputAddress(let view):
                    return stackAddress.addArrangedSubview(view)
                }
            })
        }
        stackAddress.addArrangedSubview(Spacer(16))
        self.viewAddress.layoutIfNeeded()
    }
    
    @objc func tapButtonContinue(_ sender: UIButton) {
        validateAllTextFile()
        print("tap image dot inside navigationbar")
    }
    
    func validateAllTextFile() {
        stackAddress.subviews.forEach({ v in
            if v is InputInstallationInfoView{
                let view = v as? InputInstallationInfoView
                view?.isValidate = !(view?.tfContent.text?.isEmpty ?? false)
            }
        })
    }
}

extension InstallationInfomationViewController: InstallationInfomationDelegate{
    func showPopupChooseCity() {
        print("show popup city")
    }
    
}
