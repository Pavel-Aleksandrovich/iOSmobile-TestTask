//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 09.12.2022.
//

import UIKit

final class PhotoCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: PhotoCollectionCell.self)
    
    private let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(long))
//        addGestureRecognizer(gesture)
    }
    
    @objc func long(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        
        print(translation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    func transformToStandart() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
    
    func configure(image: UIImage?) {
        photoImageView.image = image
    }
}

// MARK: - ConfigureView
private extension PhotoCollectionCell {
    
    func configureView() {
        
        backgroundColor = .darkGray
        
        photoImageView.contentMode = .scaleAspectFit
        
        addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
