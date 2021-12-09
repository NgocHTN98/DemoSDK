//
//  SeperatorTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 05/11/2021.
//

import Foundation
import UIKit
class SeperatorTableViewCell: UITableViewCell {
    
    var height: CGFloat = 1
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
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            view.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
