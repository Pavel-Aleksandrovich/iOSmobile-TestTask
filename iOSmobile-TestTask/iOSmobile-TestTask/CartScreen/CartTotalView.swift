//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 08.12.2022.
//

import UIKit

final class CartTotalView: UIView {
    
    private let topLineView = UIView()
    private let bottomLineView = UIView()
    private let totalLabel = UILabel()
    private let deliveryLabel = UILabel()
    private let totalTextLabel = UILabel()
    private let deliveryTextLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        totalLabel.text = "Total"
        totalLabel.textAlignment = .left
        
        deliveryLabel.text = "Delivery"
        deliveryLabel.textAlignment = .left
        
        totalTextLabel.text = "5000"
        totalTextLabel.textAlignment = .right
        
        deliveryTextLabel.text = "Free"
        deliveryTextLabel.textAlignment = .right
        
        topLineView.backgroundColor = .white
        
        bottomLineView.backgroundColor = .white
        
        addSubview(topLineView)
        topLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLineView.topAnchor.constraint(equalTo: topAnchor),
            topLineView.heightAnchor.constraint(equalToConstant: 2),
        ])
        
        addSubview(bottomLineView)
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 2),
        ])
        
        addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            totalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
        
        addSubview(deliveryLabel)
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            deliveryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        
        addSubview(totalTextLabel)
        totalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            totalTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
        
        addSubview(deliveryTextLabel)
        deliveryTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            deliveryTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
