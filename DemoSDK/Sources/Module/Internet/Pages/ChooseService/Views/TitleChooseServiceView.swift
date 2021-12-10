//
//  TitleChooseServiceView.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 18/11/2021.
//

import Foundation
import UIKit
class TitleChooseServiceView: UIView{
    lazy var imgTitle: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_avatar_default_bg_blue")
        return img
    }()
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor(hexString: "#030303")
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()

    init(model: TitleChooseServiceModel?) {
        super.init(frame: .zero)
        self.setupUI()
        self.setupData(model: model)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupData(model: TitleChooseServiceModel?) {
        guard let vm = model else { return }
        self.lbTitle.text = vm.title
    }
    func setupUI() {
        self.addSubview(self.imgTitle)
        self.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            imgTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            imgTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            imgTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            imgTitle.heightAnchor.constraint(equalToConstant: 24),
            imgTitle.widthAnchor.constraint(equalToConstant: 24),
            
            lbTitle.leadingAnchor.constraint(equalTo: self.imgTitle.trailingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            lbTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
}
struct TitleChooseServiceModel {
    let title: String?
}
