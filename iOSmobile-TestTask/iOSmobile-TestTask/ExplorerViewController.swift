//
//  ViewController.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 05.12.2022.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator
import RxGesture

final class ExplorerViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: layout)
    let dispose = DisposeBag()
    let navView = ExplorerNavBarView()
    
    let sections: [MultipleSectionModel] = [
        .ImageProvidableSection(title: "Section 1",
            items: [.ImageSectionItem(image: UIImage(systemName: "xmark.circle")!, title: "General"),
                    .ImageSectionItem(image: UIImage(systemName: "xmark.circle")!, title: "General"),
                    .ImageSectionItem(image: UIImage(systemName: "xmark.circle")!, title: "General"),
                    .ImageSectionItem(image: UIImage(systemName: "xmark.circle")!, title: "General"),]),
        .ToggleableSection(title: "Section 2",
            items: [.ToggleableSectionItem(title: "On", enabled: true)]),
        .StepperableSection(title: "Section 3",
            items: [.StepperSectionItem(title: "1")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        navView.rightImageView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                print(#line)
            })
            .disposed(by: dispose)
        
        navigationItem.titleView = navView
        
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"),
                                                 style: .done,
                                                 target: nil,
                                                 action: nil)
        rightBarButtonItem.customView?.isUserInteractionEnabled = true
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        rightBarButtonItem.rx.tap.bind(onNext: { _ in
            print(#line)
        })
        .disposed(by: dispose)
        
        
        
        
        
        let dataSource = dataSource()
        
        Observable.just(sections)
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: dispose)
        
        
        
        
        
        
        
        
        
        
        
        
        collectionView.rx.setDelegate(self).disposed(by: dispose)
        
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 7
        
        collectionView.register(GameCollectionCell.self, forCellWithReuseIdentifier: GameCollectionCell.id)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navView.widthAnchor.constraint(equalToConstant: (navigationController?.toolbar.frame.width)!-100),
            navView.heightAnchor.constraint(equalToConstant: (navigationController?.toolbar.frame.height)!),
        ])
    }
    
   func dataSource() -> RxCollectionViewSectionedReloadDataSource<MultipleSectionModel> {
        RxCollectionViewSectionedReloadDataSource<MultipleSectionModel>(
            configureCell: { dataSource, collection, indexPath, item in
                switch dataSource[indexPath] {
                case .ImageSectionItem(image: let image, title: let title):
                    let cell: GameCollectionCell = collection.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as! GameCollectionCell
                    
                    cell.configure(image: image, title: title)
                    return cell
                case .ToggleableSectionItem(title: let title, enabled: let enabled):
                    let cell: GameCollectionCell = collection.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as! GameCollectionCell
                    
                    cell.configure(image: UIImage(systemName: "xmark.circle")!, title: title)
                    return cell
                case .StepperSectionItem(title: let title):
                    let cell: GameCollectionCell = collection.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as! GameCollectionCell
                    
                    cell.configure(image: UIImage(systemName: "xmark.circle")!, title: title)
                    return cell
                }
                
            }
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch sections[0] {
        case .ImageProvidableSection(title: let title, items: let items):
            
            return CGSize(width: (collectionView.frame.width-50) / 2, height: (collectionView.frame.width) / 2)
        case .ToggleableSection(title: let title, items: let items):
            
            return CGSize(width: (collectionView.frame.width-32) / 2, height: 100)
        case .StepperableSection(title: let title, items: let items):
            
            return CGSize(width: (collectionView.frame.width-32) / 2, height: 100)
        }
    }
    
    
}



final class ExplorerNavBarView: UIView {
    
    private let titleLabel = UILabel()
    private let leftImageView = UIImageView()
    let rightImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        titleLabel.text = "ExplorerNavBarView"
        titleLabel.textAlignment = .center
        
        rightImageView.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        leftImageView.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(rightImageView)
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightImageView.widthAnchor.constraint(equalToConstant: 30),
            rightImageView.heightAnchor.constraint(equalToConstant: 30),
            rightImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(leftImageView)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftImageView.widthAnchor.constraint(equalToConstant: 11),
            leftImageView.heightAnchor.constraint(equalToConstant: 13),
            leftImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum MultipleSectionModel {
    case ImageProvidableSection(title: String, items: [SectionItem])
    case ToggleableSection(title: String, items: [SectionItem])
    case StepperableSection(title: String, items: [SectionItem])
}

enum SectionItem: CaseIterable {
    static var allCases: [SectionItem] = SectionItem.allCases
    
    case ImageSectionItem(image: UIImage, title: String)
    case ToggleableSectionItem(title: String, enabled: Bool)
    case StepperSectionItem(title: String)
}

extension MultipleSectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch  self {
        case .ImageProvidableSection(title: _, items: let items):
            return items.map { $0 }
        case .StepperableSection(title: _, items: let items):
            return items.map { $0 }
        case .ToggleableSection(title: _, items: let items):
            return items.map { $0 }
        }
    }
    
    init(original: MultipleSectionModel, items: [Item]) {
        switch original {
        case let .ImageProvidableSection(title: title, items: _):
            self = .ImageProvidableSection(title: title, items: items)
        case let .StepperableSection(title, _):
            self = .StepperableSection(title: title, items: items)
        case let .ToggleableSection(title, _):
            self = .ToggleableSection(title: title, items: items)
        }
    }
}

extension MultipleSectionModel {
    var title: String {
        switch self {
        case .ImageProvidableSection(title: let title, items: _):
            return title
        case .StepperableSection(title: let title, items: _):
            return title
        case .ToggleableSection(title: let title, items: _):
            return title
        }
    }
}

