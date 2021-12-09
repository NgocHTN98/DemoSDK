//
//  InternetOptionViewModel.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 11/11/2021.
//

import Foundation
import UIKit
class InternetOptionViewModel {
    var data: [String] = ["Internet tốc độ cao, ổn định", "Gần 200 kênh truyền hình đặc sắc trong nước và quốc tế", "Độc quyền trực tiếp các giải đấu thuộc AFC","Cá nhân hóa nội dung giải trí theo sở thích", "Miễn phí trang bị modem, lắp đặt trong 12h"]
    var dataPackage: [ItemPackageInternetOptionModel] = [
        ItemPackageInternetOptionModel(iconPakage: UIImage(named: "avatar_blue")),
       ItemPackageInternetOptionModel(iconPakage: UIImage(named: "avatar_blue"))
    ]
    
}
enum InternetOptionViewItem {
    case itemTile
    case itemPackage
    case suggestion
    case itemDescription
}
