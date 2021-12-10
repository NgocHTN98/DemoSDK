//
//  PopupAboutFSafeViewController.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 30/11/2021.
//

import Foundation
import UIKit
class PopupAboutFSafeViewController: UIViewController {
    @IBOutlet weak var viewBody: ShadowView!
    @IBOutlet weak var iconCancel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        iconCancel.isUserInteractionEnabled = true
        iconCancel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCancelPopup)))
    }
    @objc func tapCancelPopup(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
