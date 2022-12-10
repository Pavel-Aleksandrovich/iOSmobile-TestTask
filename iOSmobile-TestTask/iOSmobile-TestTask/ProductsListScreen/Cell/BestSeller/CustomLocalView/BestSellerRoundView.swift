//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 07.12.2022.
//

import UIKit

final class BestSellerRoundView: UIView {
    
    private let imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        imageView.image = UIImage(systemName: "heart")
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width/2
    }
}
