//
//  ItemTitleContentTableViewCell.swift
//  Hi FPT
//
//  Created by TaiHA on 08/12/2021.
//

import UIKit

class ItemTitleContentTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBody: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBody.layer.cornerRadius = 20
//        viewBody.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
