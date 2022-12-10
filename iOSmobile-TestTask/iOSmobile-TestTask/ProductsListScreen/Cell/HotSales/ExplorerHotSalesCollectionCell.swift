//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class ExplorerHotSalesCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: ExplorerHotSalesCollectionCell.self)
    
    private let imageView = UIImageView()
    private let modelLabel = UILabel()
    private let descriptionLabel = UILabel()
    private lazy var newView = TextView(backgroundColor: .orange,
                                        textColor: .white,
                                        text: "New",
                                        cornerRadius: heightConstant/2)
    private let buyView = TextView(backgroundColor: .white,
                                   textColor: .black,
                                   text: "Buy now!",
                                   cornerRadius: 10)
    
    private let heightConstant: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(image: UIImage, title: String) {
        imageView.image = image
    }
}

// MARK: - ConfigureView
private extension ExplorerHotSalesCollectionCell {
    
    func configureView() {
        imageView.contentMode = .scaleAspectFit
        
        modelLabel.textAlignment = .left
        modelLabel.textColor = .white
        modelLabel.text = "Model Label"
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .white
        descriptionLabel.text = "descriptionLabel"
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newView.heightAnchor.constraint(equalToConstant: heightConstant),
            newView.widthAnchor.constraint(equalToConstant: heightConstant),
        ])
        
        addSubview(buyView)
        buyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buyView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            buyView.heightAnchor.constraint(equalToConstant: 40),
            buyView.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        addSubview(modelLabel)
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            modelLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
