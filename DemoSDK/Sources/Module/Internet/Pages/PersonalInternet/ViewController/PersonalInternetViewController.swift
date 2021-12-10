//
//  PersonalInternetViewController.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 11/11/2021.
//

import Foundation
import UIKit
//import UIKit
//import RxSwift
//import RxCocoa
//import RxDataSources
//import RxAppState
//import Cleanse
//class PersonalInternetViewController: BaseViewController<PersonalInternetViewModel> {
class PersonalInternetViewController: UIViewController {
    //MARK: Property
    @IBOutlet weak var heightNavigationBar: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraintTablewView: NSLayoutConstraint!
    lazy var viewOption: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgRight: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "ic_dot_white")
        return i
    }()
    lazy var viewHistory: UIView = {
        let v = UIView()
        return v
    }()
    lazy var imgHistory: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "clock.arrow.circlepath")
        i.tintColor = UIColor.white
        return i
    }()
    //MARK: User Rxswift
//    var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String, PersonalInternetViewItem>>?
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: Create base viewcontroller
    //    override func initViewModel() -> PersonalInternetViewModel {
    //        return PersonalInternetViewModel()
    //    }
    //    override func performBinding() {
    //        super.performBinding()
    //        guard let vm =  self.viewModel else { return }
    //        let input = PersonalInternetViewModel.Input(
    //            viewWillAppear: self.rx.viewWillAppear.take(1).mapToVoid().asDriverOnErrorJustComplete())
    //
    //        let output = vm.transform(input: input)
    //        output.fetching
    //            .drive(onNext: { [unowned self] in self.showLoading(withStatus: $0) })
    //            .disposed(by: self.disposeBag)
    //        output.error
    //            .drive(onNext: { [unowned self] in self.handleError(error: $0) })
    //            .disposed(by: self.disposeBag)
    //        output.items.drive(self.tableView.rx.items(dataSource: self.dataSource!)).disposed(by: self.disposeBag)
    //        self.tableView.reloadData()
    //    }
    //
    //    override func prepareUI() {
    //        self.setupUI()
    //    }
   
    func setupUI() {
        self.navigationBarView.setTitle("FPT Telecom")
        self.navigationBarView.vcMain = self
        self.navigationBarView.setBackgroundColor(UIColor.clear)
        setupUIViewRight()
        self.heightNavigationBar.constant = navigationBarView.safeAreaTopHeight
       
        self.view.gradientBackground(colors: [UIColor(hexString: "#4564ED").cgColor, UIColor(hexString: "#FFFFFF").cgColor], direction: .topToBottom)
        viewHeader.backgroundColor = UIColor.white.withAlphaComponent(0)
        registerTableView()
    }
    
    func setupUIViewRight() {
        self.viewHistory.addSubview(imgHistory)
        self.imgRight.translatesAutoresizingMaskIntoConstraints = false
        self.imgHistory.translatesAutoresizingMaskIntoConstraints = false
        self.viewOption.addSubview(imgRight)
        NSLayoutConstraint.activate([
            imgRight.heightAnchor.constraint(equalToConstant: 24),
            imgRight.widthAnchor.constraint(equalToConstant: 24),
            imgRight.leadingAnchor.constraint(equalTo: self.viewOption.leadingAnchor, constant: 6),
            imgRight.trailingAnchor.constraint(equalTo: self.viewOption.trailingAnchor, constant: -6),
            imgRight.topAnchor.constraint(equalTo: self.viewOption.topAnchor, constant: 6),
            imgRight.bottomAnchor.constraint(equalTo: self.viewOption.bottomAnchor, constant: -6),
            
            imgHistory.heightAnchor.constraint(equalToConstant: 24),
            imgHistory.widthAnchor.constraint(equalToConstant: 24),
            imgHistory.leadingAnchor.constraint(equalTo: self.viewHistory.leadingAnchor, constant: 6),
            imgHistory.trailingAnchor.constraint(equalTo: self.viewHistory.trailingAnchor, constant: -6),
            imgHistory.topAnchor.constraint(equalTo: self.viewHistory.topAnchor, constant: 6),
            imgHistory.bottomAnchor.constraint(equalTo: self.viewHistory.bottomAnchor, constant: -6),
        ])
        self.viewOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewDot)))
        self.viewHistory.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapViewHistory)))
    }
    func registerTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.registerCell(cellName: PersionalInternetEmptyTableViewCell.self)
        tableView.registerCell(cellName: PersonalInternetTableViewCell.self)
        tableView.registerCell(cellName: SuggestionTableViewCell.self)
        //MARK: Use rxswift
        //        self.dataSource = RxTableViewSectionedReloadDataSource.init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
        //            switch item {
        //            case .itemEmpty:
        //                if let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersionalInternetEmptyTableViewCell", for: indexPath) as? PersionalInternetEmptyTableViewCell {
        //                    return cell
        //                }
        //            case .item:
        //                if let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersonalInternetTableViewCell", for: indexPath) as? PersonalInternetTableViewCell {
        //
        //                    cell.navigationPage = {
        //                        let storyBoard : UIStoryboard = UIStoryboard(name: "InternetOptionStoryboard", bundle:nil)
        //                        let vc = storyBoard.instantiateViewController(withIdentifier: "InternetOptionViewController")
        //                        vc.modalPresentationStyle = .fullScreen
        //                        self.present(vc, animated:true, completion:nil)
        //                    }
        //                    return cell
        //                }
        //            case .suggestion(let vm):
        //                if let cell = self.tableView.dequeueReusableCell(withIdentifier: "SuggestionTableViewCell", for: indexPath) as? SuggestionTableViewCell {
        //                    cell.viewModel = vm
        //                    return cell
        //                }
        //            }
        //            return UITableViewCell()
        //        })
        
    }
    
    
    @objc func tapViewDot(_ sender: UITapGestureRecognizer) {
        print("tap image dot inside navigationbar")
    }
    @objc func tapViewHistory(_ sender: UITapGestureRecognizer) {
        print("tap image history inside navigationbar")
    }
    
    var data: [PersonalInternetViewItem] = [
        PersonalInternetViewItem.itemEmpty,
        PersonalInternetViewItem.item(PersonalInternetTableViewCellModel(title: "Internet", banner: "Banner", iconType: "camera_list_icon")),
        PersonalInternetViewItem.item(PersonalInternetTableViewCellModel(title: "Internet - Truyền hình", banner: "Banner", iconType: "camera_list_icon")),
        PersonalInternetViewItem.suggestion(SuggestionTableViewModel(data: [
            SuggestionPackageCollectionViewModel(id: "1", name_package: "Super150", content: "Hình ảnh sắc nét Full HD 1080 Hiển thị màu trong điều kiện thiếu sáng", price: 320.000, imgPackage: "ic_Logo_Voucher", discount: 540.000),
            SuggestionPackageCollectionViewModel(id: "2", name_package: "Super200", content: "Hình ảnh sắc nét Full HD 1080p Hiển thị màu trong điều kiện thiếu sáng", price: 320.000, imgPackage: "ic_Logo_Voucher", discount: 540.000),
            SuggestionPackageCollectionViewModel(id: "3", name_package: "Super250", content: "Hình ảnh sắc nét Full HD 1080p Hiển thị màu trong điều kiện thiếu sáng", price: 320.000, imgPackage: "ic_Logo_Voucher", discount: 540.000),
            SuggestionPackageCollectionViewModel(id: "4", name_package: "Super300", content: "Hình ảnh sắc nét Full HD 1080p Hiển thị màu trong điều kiện thiếu sáng", price: 320.000, imgPackage: "ic_Logo_Voucher", discount: 540.000)
        ]))]
                                                                                                                        
}
extension PersonalInternetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case .itemEmpty:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersionalInternetEmptyTableViewCell", for: indexPath) as? PersionalInternetEmptyTableViewCell {
                return cell
            }
        case .item(let vm):
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersonalInternetTableViewCell", for: indexPath) as? PersonalInternetTableViewCell {
                cell.viewModel = vm
                cell.navigationPage = {
                    InternetManager.shared.navigationToInternetOptionVC(vcMain: self)
                }
                return cell
            }
        case .suggestion(let vm):
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "SuggestionTableViewCell", for: indexPath) as? SuggestionTableViewCell {
                cell.viewModel = vm
                
                return cell
            }
        }
        return UITableViewCell()
    }
}
                                                                                                                                        
