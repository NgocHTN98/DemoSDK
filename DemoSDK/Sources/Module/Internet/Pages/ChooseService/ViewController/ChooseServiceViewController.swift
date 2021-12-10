//
//  ChooseServiceViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import UIKit

class ChooseServiceViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var viewBodyShadow: UIView!
    @IBOutlet weak var viewShadowFooter: UIView!
    @IBOutlet weak var stackBody: UIStackView!
    @IBOutlet weak var btnContinue: ButtonMain!
    @IBOutlet weak var heightNavigationView: NSLayoutConstraint!
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    func setupUI() {
        self.heightNavigationView.constant = navigationBarView.safeAreaTopHeight
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setTitle("Chọn dịch vụ")
        self.navigationBarView.delegate = self
        self.navigationBarView.setBackgroundColor(UIColor(hexString: "#4564ED"))
        self.btnContinue.isEnabled = true
        
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
        self.stackBody.addArrangedSubview(TitleChooseServiceView(model: TitleChooseServiceModel(title: "Gói dịch vụ")))
        self.stackBody.addArrangedSubview(ItemChoosePackageView())
        self.stackBody.addArrangedSubview(TitleChooseServiceView(model: TitleChooseServiceModel(title: "Thời hạn")))
        self.addViewPackage()
       
        self.stackBody.addArrangedSubview(TitleChooseServiceView(model: TitleChooseServiceModel(title: "Dịch vụ đính kèm")))
        let fSafe = ServiceAttachmentView()
        fSafe.showPopup = {
            let storyBoard : UIStoryboard = UIStoryboard(name: "PopupAboutFSafeStoryboard", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "PopupAboutFSafeViewController")
            vc.modalPresentationStyle = .overCurrentContext
            vc.definesPresentationContext = true
            self.present(vc, animated:true, completion:nil)
        }
        self.stackBody.addArrangedSubview(fSafe)
       
        self.viewShadowFooter.layer.shadowColor = UIColor.black.cgColor
        self.viewShadowFooter.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewShadowFooter.layer.shadowOpacity = 0.2
        self.viewShadowFooter.layer.cornerRadius = 12
        viewShadowFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.viewBodyShadow.layoutIfNeeded()
        self.viewBodyShadow.layer.shadowColor = UIColor.black.cgColor
        self.viewBodyShadow.layer.cornerRadius = 12
        self.viewBodyShadow.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewBodyShadow.layer.shadowOpacity = 0.2
       
    }
    
    func addViewPackage() {
        let vPackage = MonthlyPackageView()
        vPackage.addItemSubView()
        self.stackBody.addArrangedSubview(vPackage)
        self.viewBodyShadow.layoutIfNeeded()
    }
}
extension ChooseServiceViewController: NavigationBarDelegate {
    func tapViewOption() {
        print("tap option")
    }
}
