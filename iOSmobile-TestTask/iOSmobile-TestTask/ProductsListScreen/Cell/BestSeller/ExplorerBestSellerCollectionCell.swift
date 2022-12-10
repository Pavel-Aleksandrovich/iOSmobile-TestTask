//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 07.12.2022.
//

import UIKit

final class ExplorerBestSellerCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: ExplorerBestSellerCollectionCell.self)
    
    private let imageView = UIImageView()
    private let priceLabel = UILabel()
    private let oldPriceLabel = UILabel()
    private let nameLabel = UILabel()
    private let hStackView = UIStackView()
    private let favoriteView = BestSellerRoundView()
    
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
        imageView.image = image
        
        nameLabel.text = "nameLabel"
        priceLabel.text = "priceLabel"
        oldPriceLabel.text = "oldPriceLabel"
    }
}

// MARK: - ConfigureView
private extension ExplorerBestSellerCollectionCell {
    
    func configureView() {
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.textAlignment = .left
        priceLabel.textAlignment = .left
        oldPriceLabel.textAlignment = .left
        
        hStackView.axis = .horizontal
        hStackView.alignment = .trailing
        hStackView.distribution = .fill
        hStackView.spacing = 5
        hStackView.backgroundColor = .red
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        hStackView.addArrangedSubview(priceLabel)
        hStackView.addArrangedSubview(oldPriceLabel)
        
        addSubview(hStackView)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            hStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: hStackView.topAnchor),
        ])
        
        contentView.addSubview(favoriteView)
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            favoriteView.topAnchor.constraint(equalTo: topAnchor, constant: -10),
            favoriteView.widthAnchor.constraint(equalToConstant: 30),
            favoriteView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
