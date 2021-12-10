//
//  UIViewController+Extensions.swift
//  DemoSDK
//
//  Created by TaiHA on 10/12/2021.
//

import Foundation
extension UIViewController {
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController == navigationController
        let presentinIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentinIsTabBar
    }
    
}
