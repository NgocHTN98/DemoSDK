//
//  RegistrationInfomationViewModel.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 22/11/2021.
//

import Foundation
import UIKit
class RegistrationInfomationViewModel {
    var data: [RegistrationInfoItemView] = [
        .title(TitleRegistrationInfomationView()),
        .textField(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Nhập họ và tên", title: "Họ và tên", titleValidate: "Vui lòng nhập họ và tên."))),
        .textField(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Nhập số điện thoại", title: "Số điện thoại", titleValidate: "Vui lòng nhập số điện thoại."))),
        .textField(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Nhập ngày sinh", title: "Ngày sinh", titleValidate: "Vui lòng nhập ngày sinh."))),
        .textField(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Nhập số CMND/CCCD", title: "Số CMND/CCCD", titleValidate: "Vui lòng nhập CMND/CCCD."))),
        .textField(TextFieldValidateView(model: TextFieldValidateModel(placeholder: "Nhập địa chỉ email", title: "Địa chỉ email", titleValidate: "Vui lòng nhập địa chỉ email."))),
        .gender(ItemGenderView())
       
        
    ]
}

enum RegistrationInfoItemView
{
    case title(TitleRegistrationInfomationView)
    case textField(TextFieldValidateView)
    case gender(ItemGenderView)
}
