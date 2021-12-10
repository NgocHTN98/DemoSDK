//
//  BillingInfomationViewModel.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 02/12/2021.
//

import Foundation
class BillingInfomationViewModel {
    var data: [BillingInfomationViewItem] = [
            .title(TitleBillTableViewCellModel(title: "Thông tin đăng ký", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .customerInfo,
            .title(TitleBillTableViewCellModel(title: "Thông tin lắp đặt", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .address,
            .title(TitleBillTableViewCellModel(title: "Thời gian lắp đặt", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .installTime,
            .seperotor,
            .title(TitleBillTableViewCellModel(title: "Thông tin đơn hàng", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .orderInfo,
            .seperotor,
            .title(TitleBillTableViewCellModel(title: "Người giới thiệu", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .inptuPresenter,
            .seperotor,
            .voucher,
            .seperotor,
            .title(TitleBillTableViewCellModel(title: "Hình thức thanh toán", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
            .payments,
            .seperotor,
            .title(TitleBillTableViewCellModel(title: "Thông tin thanh toán", nameIcon: "ic_person_blue", isHiddenIconRight: false)),
        .billInfo]
}
enum BillingInfomationViewItem {
    case title(TitleBillTableViewCellModel)
    case customerInfo
    case address
    case installTime
    case orderInfo
    case inptuPresenter
    case voucher
    case payments
    case billInfo
    case seperotor
}
