//
//  InternetOptionViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 15/11/2021.
//

import UIKit

class InternetOptionViewController: UIViewController {
    
    @IBOutlet weak var imgBuilding: UIImageView!
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var viewBuilding: UIView!
    @IBOutlet weak var viewPerson: UIView!
    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var iconBack: UIImageView!
    @IBOutlet weak var iconFunctionRight: UIImageView!
    @IBOutlet weak var viewHeaderTab: UIView!
    @IBOutlet weak var safeAreaTopHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraintTableView: NSLayoutConstraint!
    @IBOutlet weak var heightViewHeaderTab: NSLayoutConstraint!
    var viewModel = InternetOptionViewModel()
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
        // Do any additional setup after loading the view.
    }
    func setupUI() {
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        self.navigationBarView.setTitle("Internet")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setBackgroundColor(UIColor(hexString: "#4564ED"))
        setupUIViewRight()
        self.safeAreaTopHeight.constant = self.navigationBarView.safeAreaTopHeight
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            heightViewHeaderTab.constant = window.safeAreaInsets.top + viewHeaderTab.frame.height
        }

        self.setupLayoutViewHeader()
        self.iconBack.isUserInteractionEnabled = true
        self.iconBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackPage)))
        self.iconFunctionRight.isUserInteractionEnabled = true
        iconFunctionRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewDot)))
        registerTableViewCell()
    }
    func setupUIViewRight() {
        self.viewRight.translatesAutoresizingMaskIntoConstraints = false
        self.imgRight.translatesAutoresizingMaskIntoConstraints = false
        self.viewRight.addSubview(imgRight)
        NSLayoutConstraint.activate([
            imgRight.heightAnchor.constraint(equalToConstant: 24),
            imgRight.widthAnchor.constraint(equalToConstant: 24),
            imgRight.leadingAnchor.constraint(equalTo: self.viewRight.leadingAnchor, constant: 6),
            imgRight.trailingAnchor.constraint(equalTo: self.viewRight.trailingAnchor),
            imgRight.topAnchor.constraint(equalTo: self.viewRight.topAnchor, constant: 6),
            imgRight.bottomAnchor.constraint(equalTo: self.viewRight.bottomAnchor, constant: -6),
        ])
        
        self.viewRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewDot)))
    }
    
    @objc func tapBackPage(_ sender: UITapGestureRecognizer) {
//        navigationBarView.goBack()
    }
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        print("tap image dot inside navigationbar")
    }
    func setupLayoutViewHeader() {
        self.imgPerson.image = tabBarView.imageCombo.image
        self.imgBuilding.image = tabBarView.imageOnly.image
        self.viewPerson.backgroundColor = UIColor.clear
        self.viewBuilding.backgroundColor = UIColor.clear
        self.viewPerson.layer.cornerRadius = 8
        self.viewBuilding.layer.cornerRadius = 8
        self.viewPerson.layer.borderWidth = 1
        self.viewPerson.layer.borderColor = UIColor.white.cgColor
        self.viewBuilding.layer.borderWidth = 1
        self.viewBuilding.layer.borderColor = UIColor.white.cgColor
    }
    
    func registerTableViewCell() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerCell(cellName: ItemContentPackageTableViewCell.self)
        tableView.registerCell(cellName: ItemTitleContentTableViewCell.self)
        tableView.registerCell(cellName: SuggestionTableViewCell.self)
        tableView.registerCell(cellName: ItemDescriptionContentTableViewCell.self)
    }
    
    var data: [InternetOptionViewItem] = [.itemTile,
                                          .itemDescription,.itemPackage, .suggestion]
}

extension InternetOptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupLayoutViewHeader()
        let scrollOffsetY = tableView.contentOffset.y;
        let naviOffsetY = self.navigationBarView.frame.origin.y
        if(scrollOffsetY < 0)
        {
            //Pulling down
            UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction) {
                self.navigationBarView.alpha = 1.0
                self.tabBarView.alpha = 1.0
                self.tabBarView.frame.origin.y = self.navigationBarView.frame.height + naviOffsetY
                self.topConstraintTableView.constant = 0
                self.topConstraintTableView.isActive = true
                print("down")
            }
        }
        else if scrollOffsetY > 0 {
            UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction) {
                //Pulling up
                self.navigationBarView.alpha = 0.0
                self.tabBarView.alpha = 0.0
                let topConstr = self.tabBarView.frame.size.height + self.navigationBarView.frame.size.height - self.viewHeaderTab.frame.height
                self.topConstraintTableView.constant = -(topConstr)
                self.topConstraintTableView.isActive = true
                print("up")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case .itemTile:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemTitleContentTableViewCell", for: indexPath) as? ItemTitleContentTableViewCell {
                return cell
            }
            
        case .itemPackage:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemContentPackageTableViewCell", for: indexPath) as? ItemContentPackageTableViewCell {
                return cell
            }
            
        case .suggestion:
//            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "SuggestionTableViewCell", for: indexPath) as? SuggestionTableViewCell {
//                return cell
//            }
            break
        case .itemDescription:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemDescriptionContentTableViewCell", for: indexPath) as? ItemDescriptionContentTableViewCell {
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    
    
}
