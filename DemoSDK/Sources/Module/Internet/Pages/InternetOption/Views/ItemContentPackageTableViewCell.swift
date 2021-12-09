//
//  ItemContentPackageTableViewCell.swift
//  Hi FPT
//
//  Created by TaiHA on 07/12/2021.
//

import UIKit
import SwiftUI

class ItemContentPackageTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBody: UIView!
    @IBOutlet weak var discount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//        self.collectionView.register(UINib(nibName: "ItemTitleContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemTitleContentCollectionViewCell")
       
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//extension ItemContentPackageTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//
//        return CGSize(width: UIScreen.main.bounds.width, height: 195)
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ItemTitleContentCollectionViewCell", for: indexPath) as? ItemTitleContentCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        return cell
//    }
//}
