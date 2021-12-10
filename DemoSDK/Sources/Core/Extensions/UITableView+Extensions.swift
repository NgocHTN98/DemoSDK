//
//  UITableView+Extensions.swift
//  DemoSDK
//
//  Created by TaiHA on 10/12/2021.
//

import Foundation
extension UITableView {
    func registerCell(cellName: UITableViewCell.Type) {
        self.register(UINib(nibName: String(describing: cellName), bundle: Bundle(for: cellName.self)), forCellReuseIdentifier: String(describing: cellName))
    }
}
