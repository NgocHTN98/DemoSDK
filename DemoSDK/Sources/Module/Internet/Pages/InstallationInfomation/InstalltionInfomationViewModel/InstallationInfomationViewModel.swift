//
//  InstallationInfomationViewModel.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 23/11/2021.
//

import Foundation

protocol InstallationInfomationDelegate {
    func showPopupChooseCity() -> ()
}
class InstallationInfomationViewModel {
    var delegate: InstallationInfomationDelegate?
    
    var data: [InstallationInfomationItemView] = []
    init() {
        setupData()
    }
    func setupData() {
        let temp: [InstallationInfomationItemView] = [
            .title(TitleInstallationInfoView()),
            .input(InputInstallationInfoView(model: InputInstallationInfoViewModel(
                                                placeholder: "Chọn tỉnh/Thành phố",
                                                titleValidate: "Vui lòng chọn tỉnh/thành phố.")),
                   InputInstallationInfoEvent(navigationPage: navigationToCityPage)),
            .input(InputInstallationInfoView(model: InputInstallationInfoViewModel(
                                                placeholder: "Chọn Quận/Huyện",
                                                titleValidate: "Vui lòng chọn quận/huyện.")),
                   InputInstallationInfoEvent(navigationPage: navigationToCityPage)),
            .input(InputInstallationInfoView(model: InputInstallationInfoViewModel(
                                                placeholder: "Chọn Phường/Xã",
                                                titleValidate: "Vui lòng chọn phường/xã.")),
                   InputInstallationInfoEvent(navigationPage: navigationToCityPage)),
            .input(InputInstallationInfoView(model: InputInstallationInfoViewModel(
                                                placeholder: "Chọn Đường/Phố",
                                                titleValidate: "Vui lòng chọn đường/phố.")),
                   InputInstallationInfoEvent(navigationPage: navigationToCityPage)),
            .inputAddress(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Ví dụ: 16, Hẻm 32, Ngách 65, Ngõ 165", title: "Địa chỉ/Số nhà", titleValidate: "Vui lòng nhập họ và tên."))),
        ]
        self.data = temp
    }
    func navigationToCityPage() {
        self.delegate?.showPopupChooseCity()
    }
}
enum InstallationInfomationItemView
{
    case title(TitleInstallationInfoView)
    case input(InputInstallationInfoView, InputInstallationInfoEvent)
    case houseType(HouseTypeInstallationInfoView)
    case inputAddress(TextFieldValidateView)
}
