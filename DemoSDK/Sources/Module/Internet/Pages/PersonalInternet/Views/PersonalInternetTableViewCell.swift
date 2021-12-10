//
//  PersonalInternetTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 12/11/2021.
//

import UIKit

class PersonalInternetTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBody: UIView!
    
    @IBOutlet weak var viewRightFooter: UIView!
    @IBOutlet weak var viewFooter: UIView!
    var navigationPage: (() -> Void)? = nil
    @IBOutlet weak var viewPackage: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var iconType: UIImageView!
    @IBOutlet weak var title: UILabel!
    var viewModel: PersonalInternetTableViewCellModel? {
        didSet {
            guard let vm = viewModel else { return }
            imgBanner.image = UIImage(named: vm.banner ?? "")
            iconType.image = UIImage(named: vm.iconType ?? "")
            title.text = vm.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.viewBody.layer.cornerRadius = 8
        self.viewRightFooter.clipsToBounds = true
        self.viewFooter.clipsToBounds = true
        self.viewRightFooter.gradientBackground(colors: [UIColor(hexString: "#4564ED").withAlphaComponent(0.4).cgColor, UIColor(hexString: "#4564ED").withAlphaComponent(0).cgColor], direction: .leftToRight)
        self.viewRightFooter.layer.cornerRadius = self.viewRightFooter.bounds.height / 2
        self.viewBody.layer.shadowColor = UIColor.black.cgColor
        self.viewBody.layer.cornerRadius = 8
        self.viewBody.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.viewBody.layer.shadowOpacity = 0.2
        self.viewPackage.backgroundColor = UIColor(hexString: "#4564ED")
        self.viewPackage.layer.cornerRadius = 17
        self.viewPackage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewPackage)))
    }
    
    @objc func tapViewPackage(_ sender: UITapGestureRecognizer) {
       self.navigationPage?()
    }
    
}
struct PersonalInternetTableViewCellModel {
    let title: String?
    let banner: String?
    let iconType: String?
}
