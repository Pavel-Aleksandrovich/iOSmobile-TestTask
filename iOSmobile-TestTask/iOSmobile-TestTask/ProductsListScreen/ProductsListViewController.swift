//
//  viewConstroller.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class ProductsListViewController: UIViewController {
    
    enum Section {
        case selectCategory
        case search
        case hotSales
        case bestSeller
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: createLayout())
//    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    private let sections: [Section] = [.selectCategory, .search, .hotSales, .bestSeller]
    
    private let tabBar = MainTabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        collectionView.register(ExplorerCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExplorerCollectionHeaderView.id)
        collectionView.register(GameCollectionCell.self, forCellWithReuseIdentifier: GameCollectionCell.id)
        collectionView.register(ExplorerCategoryCollectionCell.self, forCellWithReuseIdentifier: ExplorerCategoryCollectionCell.id)
        collectionView.register(ExplorerHotSalesCollectionCell.self, forCellWithReuseIdentifier: ExplorerHotSalesCollectionCell.id)
        collectionView.register(ExplorerSearchCollectionCell.self, forCellWithReuseIdentifier: ExplorerSearchCollectionCell.id)
        collectionView.register(ExplorerBestSellerCollectionCell.self, forCellWithReuseIdentifier: ExplorerBestSellerCollectionCell.id)
        
        view.addSubview(tabBar)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tabBar.heightAnchor.constraint(equalToConstant: 70),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onCartTap))
        tabBar.cardImageView.addGestureRecognizer(gesture)
    }
    
    @objc func onCartTap() {
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionKind = self.sections[sectionIndex] //else { return nil }
            let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
            
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        
        return layout
    }
    
    private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch section {
        case .selectCategory:
            return categorySection()
        case .search:
            return searchSection()
        case .hotSales:
            return cardSection()
        case .bestSeller:
            return bestSellerSection()
        }
    }
    
    private func categorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.23), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.orthogonalScrollingBehavior = .groupPaging
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func searchSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func cardSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func bestSellerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        return section
    }
    
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
//            switch self.sections[indexPath.section] {
//            case .selectCategory:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as? GameCollectionCell else { return UICollectionViewCell() }
//                cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
//                return cell
//            case .search:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as? GameCollectionCell else { return UICollectionViewCell() }
//                cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
//                return cell
//            case .hotSales:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as? GameCollectionCell else { return UICollectionViewCell() }
//                cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
//                return cell
//            case .bestSeller:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionCell.id, for: indexPath) as? GameCollectionCell else { return UICollectionViewCell() }
//                cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
//                return cell
//            }
//        }
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        snapshot.appendSections(sections)
//
//        for index in 0..<sections.count {
//            let section = sections[index]
//
//            switch sections[index] {
//            case .selectCategory:
//                snapshot.appendItems([1,2,3,4,5], toSection: section)
//            case .search:
//                snapshot.appendItems([0], toSection: section)
//            case .hotSales:
//                snapshot.appendItems([16,17,18,19,20], toSection: section)
//            case .bestSeller:
//                snapshot.appendItems([21], toSection: section)
//            }
//        }
//
//        dataSource.apply(snapshot)
//    }
}

struct SearchType: Hashable {
    let name: String
    let image: String
}


extension ProductsListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .selectCategory:
            return 10
        case .search:
            return 1
        case .hotSales:
            return 10
        case .bestSeller:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch sections[indexPath.section] {
        case .selectCategory:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExplorerCollectionHeaderView.id, for: indexPath) as? ExplorerCollectionHeaderView else { return UICollectionReusableView() }

                header.leftText = "Select Category"
                header.rightText = "see more"
                
                return header
            }
        case .search: break
        case .hotSales:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExplorerCollectionHeaderView.id, for: indexPath) as? ExplorerCollectionHeaderView else { return UICollectionReusableView() }

                header.leftText = "Hot sales"
                header.rightText = "see more"
                
                return header
            }
        case .bestSeller:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExplorerCollectionHeaderView.id, for: indexPath) as? ExplorerCollectionHeaderView else { return UICollectionReusableView() }

                header.leftText = "Best Seller"
                header.rightText = "see more"
                
                return header
            }
        }
        
        
        return UICollectionReusableView()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .selectCategory:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExplorerCategoryCollectionCell.id, for: indexPath) as? ExplorerCategoryCollectionCell else { return UICollectionViewCell() }
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
            return cell
        case .search:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExplorerSearchCollectionCell.id, for: indexPath) as? ExplorerSearchCollectionCell else { return UICollectionViewCell() }
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
            return cell
        case .hotSales:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExplorerHotSalesCollectionCell.id, for: indexPath) as? ExplorerHotSalesCollectionCell else { return UICollectionViewCell() }
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
            return cell
        case .bestSeller:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExplorerBestSellerCollectionCell.id, for: indexPath) as? ExplorerBestSellerCollectionCell else { return UICollectionViewCell() }
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill")!, title: "")
            return cell
        }
    }
}

extension ProductsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .selectCategory:
            print(#line)
        case .search:
            break
        case .hotSales:
            break
        case .bestSeller:
            print(#line)
            let vc = ProductDetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
