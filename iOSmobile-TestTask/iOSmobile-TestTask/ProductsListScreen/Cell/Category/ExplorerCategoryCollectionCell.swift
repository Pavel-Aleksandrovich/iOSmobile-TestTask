//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class ExplorerCategoryCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: ExplorerCategoryCollectionCell.self)
    
    private let roundBackgroundView = UIView()
    private let categoryImageView = UIImageView()
    private let categoryNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureView()
    }
    
    func configure(image: UIImage, title: String) {
        categoryImageView.image = image
        
        categoryNameLabel.text = "categoryNameLabel"
    }
}

// MARK: - ConfigureView
private extension ExplorerCategoryCollectionCell {
    
    func configureView() {
        let roundViewWidth = frame.width-20
        let categoryImageViewWidth = frame.width-30
        
        categoryImageView.contentMode = .scaleAspectFit
        
        roundBackgroundView.layer.cornerRadius = roundViewWidth/2
        roundBackgroundView.backgroundColor = .white
        
        categoryNameLabel.textAlignment = .center
        
        addSubview(roundBackgroundView)
        roundBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundBackgroundView.widthAnchor.constraint(equalToConstant: roundViewWidth),
            roundBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            roundBackgroundView.heightAnchor.constraint(equalToConstant: roundViewWidth),
        ])
        
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImageView.centerYAnchor.constraint(equalTo: roundBackgroundView.centerYAnchor),
            categoryImageView.centerXAnchor.constraint(equalTo: roundBackgroundView.centerXAnchor),
            categoryImageView.widthAnchor.constraint(equalToConstant: categoryImageViewWidth),
            categoryImageView.heightAnchor.constraint(equalToConstant: categoryImageViewWidth)
        ])
        
        addSubview(categoryNameLabel)
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryNameLabel.topAnchor.constraint(equalTo: roundBackgroundView.bottomAnchor),
            categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
