//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 09.12.2022.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    
    enum Section {
        case photo
        case stars
        case shop
        case parameters
        case color
        case memory
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: createLayout())
    private let addToCart = AddToCartView(leftText: "Add to Cart",
                                         rightText: "15000")
    
    private let sections: [Section] = [.photo, .stars, .shop, .parameters, .color, .memory]
    
//    let flowLayout = ZoomAndSnapFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        view.backgroundColor = .systemGray5
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.id)
        
        view.addSubview(addToCart)
        addToCart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addToCart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            addToCart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            addToCart.heightAnchor.constraint(equalToConstant: 60),
            addToCart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: addToCart.topAnchor, constant: -10),
        ])
        
//        collectionView.collectionViewLayout = ZoomAndSnapFlowLayout(frame: view.frame)
        collectionView.contentInsetAdjustmentBehavior = .always
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionKind = self.sections[sectionIndex] //else { return nil }
            let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
            
            
            return section
        }
        
       return  UICollectionViewCompositionalLayout(sectionProvider: sectionProvider,
                                                   configuration: config)
        
    }
    
    private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch section {
        case .photo:
            return listImageSection()
        case .stars:
            return cardSection()
        case .shop:
            break
        case .parameters:
            break
        case .color:
            break
        case .memory:
            break
        }
        return listImageSection()
    }
    
    private func listImageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    private func cardSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}

extension ProductDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .photo:
            return 10
        case .stars:
            return 10
        case .shop:
            return 10
        case .parameters:
            return 10
        case .color:
            return 10
        case .memory:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .photo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        case .stars:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        case .shop:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        case .parameters:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        case .color:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        case .memory:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.id, for: indexPath) as? PhotoCollectionCell else { return UICollectionViewCell() }
            
            cell.configure(image: UIImage(systemName: "arrowshape.turn.up.forward.fill"))
            
            return cell
        }
    }
    
    
}

extension ProductDetailsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(#function)
    }
}
class ZoomAndSnapFlowLayout: UICollectionViewFlowLayout {

    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0.3

    
    init(frame: CGRect) {
        super.init()

        scrollDirection = .horizontal
        minimumLineSpacing = 40
        itemSize = CGSize(width: frame.width-150, height: frame.width-100)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func prepare() {
        guard let collectionView = collectionView else { return }
        
//        let itemSize = CGSize(width: collectionView.frame.width*0.7,
//                              height: collectionView.frame.width)
        
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - itemSize.height) / 2
        let horizontalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: 0, left: horizontalInsets, bottom: 0, right: horizontalInsets)

        super.prepare()
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        let rectAttributes = super.layoutAttributesForElements(in: rect)!.map { $0.copy() as! UICollectionViewLayoutAttributes }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.frame.size)

        // Make the cells be zoomed when they reach the center of the screen
        for attributes in rectAttributes where attributes.frame.intersects(visibleRect) {
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = distance / activeDistance

            if distance.magnitude < activeDistance {
                let zoom = 1 + zoomFactor * (1 - normalizedDistance.magnitude)
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1)
                attributes.zIndex = Int(zoom.rounded())
            }
        }

        return rectAttributes
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return .zero }

        // Add some snapping behaviour so that the zoomed cell is always centered
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else { return .zero }

        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2

        for layoutAttributes in rectAttributes {
            let itemHorizontalCenter = layoutAttributes.center.x
            if (itemHorizontalCenter - horizontalCenter).magnitude < offsetAdjustment.magnitude {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }

        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // Invalidate layout so that every cell get a chance to be zoomed when it reaches the center of the screen
        return true
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        guard let context = super.invalidationContext(forBoundsChange: newBounds) as? UICollectionViewFlowLayoutInvalidationContext else { return UICollectionViewFlowLayoutInvalidationContext() }
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}
