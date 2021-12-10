//
//  ItemDescriptionContentTableViewCell.swift
//  Hi FPT
//
//  Created by TaiHA on 09/12/2021.
//

import UIKit

class ItemDescriptionContentTableViewCell: UITableViewCell {
    //MARK: Property
    @IBOutlet weak var lbDescription: UILabel!
    var viewModel: ItemDescriptionContentTableViewCellModel? {
        didSet {
            guard let vm = viewModel else { return }
            lbDescription.text = vm.descriptionText
        }
    }
    //MARK: Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
}
struct ItemDescriptionContentTableViewCellModel {
    let descriptionText: String?
}
