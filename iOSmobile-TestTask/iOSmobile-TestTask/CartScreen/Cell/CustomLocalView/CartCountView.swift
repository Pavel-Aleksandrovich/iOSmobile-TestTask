//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 08.12.2022.
//

import UIKit

final class CartCountView: UIView {
    
    private let countLabel = UILabel()
    private let plusImageView = UIImageView()
    private let minusImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        
        minusImageView.contentMode = .scaleAspectFit
        minusImageView.image = UIImage(systemName: "minus")
        
        plusImageView.contentMode = .scaleAspectFit
        plusImageView.image = UIImage(systemName: "plus")
        
        countLabel.text = "1"
        countLabel.textAlignment = .center
        countLabel.textColor = .white
        
        addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(minusImageView)
        minusImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            minusImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            minusImageView.topAnchor.constraint(equalTo: topAnchor),
        ])
        
        addSubview(plusImageView)
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            plusImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
