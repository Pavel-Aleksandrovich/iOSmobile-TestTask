//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 09.12.2022.
//

import UIKit

final class AddToCartView: UIView {
    
    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    
    init(leftText: String, rightText: String) {
        super.init(frame: .zero)
        
        rightLabel.text = rightText
        leftLabel.text = leftText
        
        backgroundColor = .orange
        layer.cornerRadius = 10
        
        leftLabel.textColor = .white
        leftLabel.textAlignment = .left
        
        rightLabel.textColor = .white
        rightLabel.textAlignment = .right
        
        addSubview(leftLabel)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftLabel.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
        
        addSubview(rightLabel)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightLabel.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
