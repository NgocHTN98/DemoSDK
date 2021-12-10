//
//  ItemVoucherTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by TaiHA on 02/12/2021.
//

import UIKit

class ItemVoucherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var data: [String] = ["2000", "500000", "1","20"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "VoucherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VoucherCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension ItemVoucherTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //         data[indexPath.row] {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "VoucherCollectionViewCell", for: indexPath) as? VoucherCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
