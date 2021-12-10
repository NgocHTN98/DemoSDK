//
//  ItemTitleContentTableViewCell.swift
//  Hi FPT
//
//  Created by TaiHA on 08/12/2021.
//

import UIKit

class ItemTitleContentTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var viewBody: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBody.layer.cornerRadius = 20
        viewBody.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    var viewModel: ItemTitleContentTableViewCellModel? {
        didSet {
            guard let vm = viewModel else { return }
            lbTitle.text = vm.title
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
struct ItemTitleContentTableViewCellModel {
    let title: String?
}
