//
//  PackageInternetDetailViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 24/11/2021.
//

import Foundation
import UIKit
class PackageInternetDetailViewController : UIViewController {
    //MARK: Property
    @IBOutlet weak var navigationBar: NavigationBarView!
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    @IBOutlet weak var viewFooter: UIView!
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    @IBOutlet weak var stackContent: UIStackView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var viewDashed: UIView!
    @IBOutlet weak var viewTitleCollectionView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightNavigationView: NSLayoutConstraint!
    var dataContent: [String] = ["1","2","3","4"]
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        setupUIViewRight()
        self.navigationBar.setTitle("Internet Doanh nghiệp")
        self.navigationBar.vcMain = self
        self.navigationBar.setBackgroundColor(UIColor(hexString: "#4564ED"))
//        self.heightNavigationView.constant = navigationBar.safeAreaTopHeight
        //shadow view footer
        self.viewFooter.layer.cornerRadius = 18
        viewFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.dataContent.forEach {_ in
            self.stackContent.addArrangedSubview(ContentSuperView())
        }
        self.shadowView.layoutIfNeeded()
        addBoder()
        registerCollectionViewCell()
       
    }
    func addBoder() {
        let yourViewBorder = CAShapeLayer()
        let path =  UIBezierPath(roundedRect: viewDashed.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 14.0, height: 14.0))
        yourViewBorder.path = path.cgPath
            yourViewBorder.strokeColor = UIColor.white.cgColor
            yourViewBorder.lineDashPattern = [2,2]
        yourViewBorder.frame = self.viewDashed.bounds
        yourViewBorder.fillColor = UIColor.clear.cgColor
        self.viewDashed.layer.addSublayer(yourViewBorder)
        self.viewDashed.backgroundColor = UIColor.clear
        viewTitleCollectionView.layer.cornerRadius = 24
        viewTitleCollectionView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
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
    
    func registerCollectionViewCell() {

        self.collectionView.register(UINib(nibName: "SuggestionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SuggestionsCollectionViewCell")
    }
    
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        print("tap image dot inside navigationbar")
    }
}
extension PackageInternetDetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 174)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionsCollectionViewCell", for: indexPath) as? SuggestionsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
