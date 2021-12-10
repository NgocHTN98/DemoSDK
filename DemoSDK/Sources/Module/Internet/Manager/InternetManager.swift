//
//  InternetManager.swift
//  DemoSDK
//
//  Created by TaiHA on 09/12/2021.
//

import Foundation
import UIKit
public class InternetManager {
    static let shared = InternetManager()
    public init() {}
    public func navigationToPersonalInternetVC(vcMain: UIViewController) {
        let story = UIStoryboard(name: "PersonalInternetStoryboard", bundle: Bundle(for: PersonalInternetViewController.self))
        let vc = story.instantiateViewController(withIdentifier: String(describing: PersonalInternetViewController.self))
        vc.modalPresentationStyle = .fullScreen
        vc.definesPresentationContext = true
        vcMain.present(vc, animated:true, completion:nil)
        print("abc")
    }
    
    public func navigationToInternetOptionVC(vcMain: UIViewController) {
        let story = UIStoryboard(name: "InternetOptionStoryboard", bundle: Bundle(for: InternetOptionViewController.self))
        let vc = story.instantiateViewController(withIdentifier: String(describing: InternetOptionViewController.self))
        vc.modalPresentationStyle = .fullScreen
        vc.definesPresentationContext = true
        vcMain.present(vc, animated:true, completion:nil)
        print("abc")
    }
}
