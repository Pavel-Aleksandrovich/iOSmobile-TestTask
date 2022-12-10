//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 05.12.2022.
//

import UIKit

final class GameCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: GameCollectionCell.self)
    
    private let cellView = UIImageView()
    
    
//    var picture = UIImage(named: "рубашка")
//    var mainPicture = UIImage(named: "рубашка")

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(image: UIImage, title: String) {
        cellView.image = image
    }

    
}

// MARK: - ConfigureView
private extension GameCollectionCell {
    
    func configureView() {
        contentView.addSubview(cellView)
//        cellView.backgroundColor = .red
//        cellView.layer.cornerRadius = Constants.cellViewCornerRadius
//        cellView.clipsToBounds = true
        cellView.contentMode = .scaleAspectFit
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
