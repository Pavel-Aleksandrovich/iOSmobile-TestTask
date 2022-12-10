//
//  ExplorerSearchCollectionCell.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class ExplorerSearchCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: ExplorerSearchCollectionCell.self)
    
//    private let imageView = UIImageView()
    private let roundView = SearchRoundView()
    private let textField = SearchTextField()
    
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
//        imageView.image = image
    }
}

// MARK: - ConfigureView
private extension ExplorerSearchCollectionCell {
    
    func configureView() {
//        imageView.contentMode = .scaleAspectFit
        
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundView.widthAnchor.constraint(equalTo: heightAnchor),
            roundView.topAnchor.constraint(equalTo: topAnchor),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: roundView.leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
