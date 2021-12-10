//
//  BillingInfomationViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation
import UIKit
class BillingInfomationViewController: UIViewController {
    //MARK: Property
    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var btnPay: ButtonMain!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbPolicy: UILabel!
    lazy var viewRight: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    enum VCType {
        case internet
        case camera
    }
   
    var viewModel = BillingInfomationViewModel()
    func setupUI() {
        self.view.backgroundColor = UIColor(hexString: "#EFF4FF")
        setupUIViewRight()
        self.navigationBarView.setTitle("Thông tin thanh toán")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setBackgroundColor(UIColor(hexString: "#4564ED"))
        viewFooter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.btnPay.isEnabled = true
        self.btnPay.addTarget(self, action: #selector(tapButtonPay), for: .touchUpInside)
        registerTableView()
        if let policy = self.lbPolicy.text {
            let context = NSMutableAttributedString(string: "Nhấn thanh toán, bạn đồng ý với  Điều khoản của FPT Telecom")
            context.addAttributes([
                .underlineStyle: NSUnderlineStyle.thick.rawValue,
                .underlineColor: UIColor(hexString: "#4564ED"),
                .foregroundColor: UIColor(hexString: "#4564ED")
            ], range: NSRange(location: policy.count - 26, length: 10))
            
             //Add other attributes if needed
            self.lbPolicy.attributedText = context
        }
        lbPolicy.isUserInteractionEnabled = true
        lbPolicy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel)))
    }
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: lbPolicy, inRange: NSRange(location: (lbPolicy.text?.count ?? 0) - 26, length: 10)){
            print("Tapped targetRange1")
        } else {
            print("Tapped none")
        }
    }
    func registerTableView() {
        tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(hexString: "#F9FBFF")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "TitleBillTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleBillTableViewCell")
        self.tableView.register(UINib(nibName: "BillInfomationTableViewCell", bundle: nil), forCellReuseIdentifier: "BillInfomationTableViewCell")
        self.tableView.register(UINib(nibName: "InputPresenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InputPresenterTableViewCell")
        self.tableView.register(UINib(nibName: "InputPresenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InputPresenterTableViewCell")
        self.tableView.register(UINib(nibName: "ItemVoucherTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemVoucherTableViewCell")
        self.tableView.register(UINib(nibName: "ItemInstallTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemInstallTimeTableViewCell")
        self.tableView.register(UINib(nibName: "AddressInstallTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressInstallTableViewCell")
        self.tableView.register(UINib(nibName: "CustomerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomerInfoTableViewCell")
        self.tableView.register(UINib(nibName: "OrderInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderInfoTableViewCell")
        self.tableView.register(UINib(nibName: "ItemPaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemPaymentTableViewCell")
        tableView.register(ItemSeperatorTableViewCell.self, forCellReuseIdentifier: "ItemSeperatorTableViewCell")
        
    }
    @objc func tapButtonPay(_ sender: UIButton) {
        
        print("tap button payment")
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
    
}
extension BillingInfomationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.data[indexPath.row]
        switch data {
        case .title(let vm):
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "TitleBillTableViewCell", for: indexPath) as? TitleBillTableViewCell {
                cell.viewModel = vm
                return cell
            }
            
        case .customerInfo:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomerInfoTableViewCell", for: indexPath) as? CustomerInfoTableViewCell {
                return cell
            }
        case .address:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddressInstallTableViewCell", for: indexPath) as? AddressInstallTableViewCell {
                return cell
            }
        case .installTime:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemInstallTimeTableViewCell", for: indexPath) as? ItemInstallTimeTableViewCell {
                return cell
            }
        case .orderInfo:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "OrderInfoTableViewCell", for: indexPath) as? OrderInfoTableViewCell {
                return cell
            }
        case .inptuPresenter:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "InputPresenterTableViewCell", for: indexPath) as? InputPresenterTableViewCell {
                return cell
            }
        case .voucher:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemVoucherTableViewCell", for: indexPath) as? ItemVoucherTableViewCell {
                return cell
            }
        case .payments:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemPaymentTableViewCell", for: indexPath) as? ItemPaymentTableViewCell {
                return cell
            }
        case .billInfo:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "BillInfomationTableViewCell", for: indexPath) as? BillInfomationTableViewCell {
                return cell
            }
     
        case .seperotor:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemSeperatorTableViewCell", for: indexPath) as? ItemSeperatorTableViewCell {
                cell.backgroundColor = .clear
                return cell
            }
        }
        return UITableViewCell()
    }
}
