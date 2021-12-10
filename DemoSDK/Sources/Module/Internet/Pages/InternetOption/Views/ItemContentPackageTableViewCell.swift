//
//  ItemContentPackageTableViewCell.swift
//  Hi FPT
//
//  Created by TaiHA on 07/12/2021.
//

import UIKit
import SwiftUI

class ItemContentPackageTableViewCell: UITableViewCell {
    //MARK: Property
    @IBOutlet weak var viewBody: UIView!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var imgPackage: UIImageView!
    @IBOutlet weak var lbPackageName: UILabel!
    @IBOutlet weak var lbPackagePrice: UILabel!
    @IBOutlet weak var lbDiscount: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    var viewModel: ItemContentPackageTableViewCellModel? {
        didSet {
            guard let vm = viewModel else { return }
            imgPackage.image = UIImage(named: vm.imgPackage ?? "")
            lbPackageName.text = vm.titlePackage
            lbPackagePrice.text = "\(vm.packagePrice)"
            lbDiscount.text = "\(vm.discount)"
            lbDescription.text = vm.description
        }
    }
    //MARK: Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBody.layer.cornerRadius = 20
        self.viewBody.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
       
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
struct ItemContentPackageTableViewCellModel {
    let imgPackage: String?
    let titlePackage: String?
    let packagePrice: Double?
    let discount: Double?
    let description: String?
}
