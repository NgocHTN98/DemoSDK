//
//  SuggestionPackageCollectionViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 25/11/2021.
//

import UIKit

class SuggestionPackageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titlePackage: UILabel!
    @IBOutlet weak var viewShadow: ShadowView!
    @IBOutlet weak var imgPackage: UIImageView!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var packagePrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    var viewModel: SuggestionPackageCollectionViewModel? {
        didSet {
            guard let vm = viewModel else { return }
            self.imgPackage.image = UIImage(named: vm.imgPackage ?? "")
            self.titlePackage.text = vm.name_package
            self.packagePrice.text = "\(vm.price ?? 0)đ/tháng"
            if let dis = vm.discount  {
                let attributedString = NSMutableAttributedString(string: "\(dis)đ/tháng")
                attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 0, range: NSMakeRange(0, attributedString.length))
                attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.thick.rawValue), range: NSMakeRange(0, attributedString.length))
                attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor(hexString: "#767676"), range: NSMakeRange(0, attributedString.length))
                
                discount.attributedText = attributedString
            }
        }
    }
    func setupUI() {
        self.viewShadow.layer.cornerRadius = 8
        self.viewShadow.layer.shadowColor = UIColor.black.cgColor
        self.viewShadow.layer.cornerRadius = 12
        self.viewShadow.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.viewShadow.layer.shadowOpacity = 0.2
        self.imgPackage.layer.cornerRadius = 18
        
    }
}
struct SuggestionPackageCollectionViewModel {
    let id: String?
    let name_package: String?
    let content: String?
    let price: Double?
    let imgPackage: String?
    let discount: Double?
}
