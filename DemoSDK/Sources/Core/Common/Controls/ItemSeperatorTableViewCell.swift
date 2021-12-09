//
//  ItemSeperatorTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 03/12/2021.
//

import Foundation
import Foundation
import UIKit
class ItemSeperatorTableViewCell: UITableViewCell {
    lazy var view: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.selectionStyle = .none
        self.contentView.addSubview(view)
        self.view.backgroundColor = UIColor(hexString: "#F9FBFF")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 8)
        ])
        
    }
}
