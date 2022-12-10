//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 08.12.2022.
//

import UIKit

final class CartTableCell: UITableViewCell {
    
    static let id = String(describing: CartTableCell.self)
    
    private let cartImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let countView = CartCountView()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configAppearance()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartTableCell {
    
    func setViewModel() {
    }
}

// MARK: - Config Appearance
private extension CartTableCell {
    
    func configAppearance() {
        backgroundColor = .red
    }
    
}

// MARK: - Make Constraints
private extension CartTableCell {
    
    func makeConstraints() {
        
        cartImageView.image = UIImage(systemName: "xmark.circle")
        
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.text = "nameLabel.text"
        
        priceLabel.numberOfLines = 0
        priceLabel.textAlignment = .left
        priceLabel.text = "priceLabel"
        
//        countView.backgroundColor = .darkGray
        
        addSubview(cartImageView)
        cartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cartImageView.widthAnchor.constraint(equalToConstant: 100),//frame.height-10),
            cartImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cartImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        
        addSubview(countView)
        countView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            countView.widthAnchor.constraint(equalToConstant: 40),
            countView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            countView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: countView.leadingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: cartImageView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: countView.leadingAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: cartImageView.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
        ])
    }
}
