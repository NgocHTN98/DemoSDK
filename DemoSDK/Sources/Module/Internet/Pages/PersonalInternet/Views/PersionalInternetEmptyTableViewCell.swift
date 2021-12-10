//
//  PersionalInternetEmptyTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 12/11/2021.
//

import UIKit

class PersionalInternetEmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var viewEmpty: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor =  UIColor.white.withAlphaComponent(0)
        self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.viewEmpty.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
