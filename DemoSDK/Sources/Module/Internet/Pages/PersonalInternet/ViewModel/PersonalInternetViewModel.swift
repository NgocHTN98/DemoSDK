//
//  PersonalInternetViewModel.swift
//  HIFPT_NGOC
//
//  Created by NgocHTN on 11/11/2021.
//

import Foundation
//import RxSwift
//import RxCocoa
//import RxDataSources
protocol PersonalInternetLogic {
    func reloadTableView()
}
class PersonalInternetViewModel{
    func navigationPage() {}
    var viewLogic: PersonalInternetLogic?
//    let service = InternetServices()
//    struct Input {
//        let viewWillAppear: Driver<Void>
//    }
//    struct Output {
//        let fetching: Driver<Bool>
//        let error: Driver<Error>
//        let items: Driver<[SectionModel<String, PersonalInternetViewItem>]>
//    }
   
//    let viewItemBehaviorRelay = BehaviorRelay<[SectionModel<String, PersonalInternetViewItem>]>(value: [SectionModel(model: "", items: [])])
    
//    override func transform(input: PersonalInternetViewModel.Input) -> PersonalInternetViewModel.Output {
//        input.viewWillAppear.flatMap { [unowned self] _ in
//            return Observable.deferred { [unowned self] in
//                return self.getData().map {
//                    [SectionModel(model: "", items: $0)]
//                }
//                .trackActivity(self.activityIndicator)
//                .trackError(self.errorTracker)
//            }
//            .trackActivity(self.activityIndicator)
//            .trackError(self.errorTracker)
//            .asDriverOnErrorJustComplete()
//        }.drive(viewItemBehaviorRelay).disposed(by: self.disposeBag)
//        return Output(
//            fetching: activityIndicator.asDriver(),
//            error: errorTracker.asDriver(),
//            items: viewItemBehaviorRelay.asDriverOnErrorJustComplete())
//    }
    
//    func getData() -> [PersonalInternetViewItem] {
//        return self.service.getData().map { reponse -> [PersonalInternetViewItem] in
//            var list: [PersonalInternetViewItem] = []
//            list.append(.itemEmpty)
//            let package = reponse?.items.map { item in
//                return PersonalInternetViewItem.item
//            }
//            list.append(contentsOf: package ?? [])
//            let suggestion = reponse?.suggestions.map({ sug in
//                return SuggestionPackageCollectionViewModel(id: sug.id, name_package: sug.name_package, content: sug.content, price: sug.price)
//            })
//            if suggestion?.count ?? -1 > 0 {
//                list.append(.suggestion(SuggestionTableViewModel(data: suggestion ?? [])))
//            }
//            return list
//        }
//    }
}
enum PersonalInternetViewItem {
    case itemEmpty
    case item(PersonalInternetTableViewCellModel)
    case suggestion(SuggestionTableViewModel)
}


