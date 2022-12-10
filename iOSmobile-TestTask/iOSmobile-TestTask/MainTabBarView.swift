//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 07.12.2022.
//

import UIKit

final class MainTabBarView: UIView {
    
    private let hStackView = UIStackView()
    
    private let explorerView = UIImageView()
    private let textLabel = UILabel()
    let cardImageView = UIImageView()
    private let favoriteImageView = UIImageView()
    private let accountImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        hStackView.axis = .horizontal
        hStackView.alignment = .center
        hStackView.distribution = .equalSpacing
        hStackView.spacing = 5
//        hStackView.backgroundColor = .red
        
        backgroundColor = .darkGray
        
        textLabel.text = "explorerView"
        
        explorerView.image = UIImage(systemName: "")
        cardImageView.image = UIImage(systemName: "bag")
        favoriteImageView.image = UIImage(systemName: "heart")
        accountImageView.image = UIImage(systemName: "person")
        
        
        cardImageView.isUserInteractionEnabled = true
        
        addSubview(hStackView)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        hStackView.addArrangedSubview(textLabel)
        hStackView.addArrangedSubview(cardImageView)
        hStackView.addArrangedSubview(favoriteImageView)
        hStackView.addArrangedSubview(accountImageView)
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 30),
            cardImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteImageView.widthAnchor.constraint(equalToConstant: 30),
            favoriteImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        accountImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accountImageView.widthAnchor.constraint(equalToConstant: 30),
            accountImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
