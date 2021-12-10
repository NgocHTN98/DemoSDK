//
//  VoucherCollectionViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 24/11/2021.
//

import UIKit

class VoucherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBorder: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    func setupUI() {
        viewBorder.layer.cornerRadius = 8
        viewBorder.layer.borderWidth = 1
        viewBorder.layer.borderColor = UIColor(hexString: "#4564ED").cgColor
        viewBorder.backgroundColor = UIColor(hexString: "#F2F5FF")
    }
}
