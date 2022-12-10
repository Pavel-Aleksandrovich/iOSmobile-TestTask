//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class SearchRoundView: UIView {
    
    private let imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrowshape.turn.up.forward.fill")
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
