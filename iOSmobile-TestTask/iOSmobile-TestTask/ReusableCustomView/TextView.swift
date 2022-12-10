//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 07.12.2022.
//

import UIKit

final class TextView: UIView {
    
    private let textLabel = UILabel()
    
    init(backgroundColor: UIColor, textColor: UIColor, text: String, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        textLabel.textColor = textColor
        textLabel.text = text
        layer.cornerRadius = cornerRadius
        
        textLabel.textAlignment = .center
        
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
