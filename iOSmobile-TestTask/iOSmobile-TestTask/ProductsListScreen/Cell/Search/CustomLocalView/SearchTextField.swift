//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 06.12.2022.
//

import UIKit

final class SearchTextField: UITextField {
    
    private let imageView = UIImageView()
    
    private let padding = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    init() {
        super.init(frame: .zero)
        placeholder = "Search"
        
        clipsToBounds = true
        borderStyle = .roundedRect
                autocorrectionType = .no
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrowshape.turn.up.forward.fill")
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
    }
}
