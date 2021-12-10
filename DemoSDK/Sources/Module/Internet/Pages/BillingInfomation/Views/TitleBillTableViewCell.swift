//
//  TitleBillTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 02/12/2021.
//

import UIKit

class TitleBillTableViewCell: UITableViewCell {
    //MARK: Property
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var iconTitle: UIImageView!
    @IBOutlet weak var iconPencil: UIImageView!
    var viewModel: TitleBillTableViewCellModel? {
        didSet {
            guard let vm = viewModel else { return }
            lbTitle.text = vm.title
            iconTitle.image = UIImage(named: vm.nameIcon ?? "ic_person_blue")
            iconPencil.isHidden = vm.isHiddenIconRight ?? true
        }
    }
    //MARK: Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}

struct TitleBillTableViewCellModel {
    let title: String?
    let nameIcon: String?
    let isHiddenIconRight: Bool?
}
