//
//  SuggestionTableViewCell.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 25/11/2021.
//

import UIKit
//import RxDataSources
class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBody: UIView!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var data: [SuggestionPackageCollectionViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    var viewModel: SuggestionTableViewModel? {
        didSet {
            guard let vm = viewModel else { return }
            self.data = vm.data

        }
    }
    func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        addBoder()
        registercollectionView()
    }

    func addBoder() {
        let yourViewBorder = CAShapeLayer()
        let path =  UIBezierPath(roundedRect: viewLine.frame, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 14.0, height: 14.0))
        yourViewBorder.path = path.cgPath
            yourViewBorder.strokeColor = UIColor.white.cgColor
            yourViewBorder.lineDashPattern = [2,2]
        yourViewBorder.frame = self.viewLine.bounds
        yourViewBorder.fillColor = UIColor.clear.cgColor
        self.viewBody.layer.addSublayer(yourViewBorder)
        self.viewLine.backgroundColor = UIColor.clear
        viewBody.layer.cornerRadius = 24
        viewBody.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }

    func registercollectionView() {
        self.collectionView.register(UINib(nibName: "SuggestionPackageCollectionViewCell", bundle: Bundle(for: SuggestionPackageCollectionViewCell.self)), forCellWithReuseIdentifier: "SuggestionPackageCollectionViewCell")
    }
}
extension SuggestionTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 272, height: 195)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionPackageCollectionViewCell", for: indexPath) as? SuggestionPackageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = self.data[indexPath.row]
        return cell
    }
}

class SuggestionTableViewModel {
    let data: [SuggestionPackageCollectionViewModel]
    init(data: [SuggestionPackageCollectionViewModel]) {
        self.data = data
    }
}
