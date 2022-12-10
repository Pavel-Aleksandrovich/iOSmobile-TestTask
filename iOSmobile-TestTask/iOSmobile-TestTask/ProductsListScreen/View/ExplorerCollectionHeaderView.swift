//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 09.12.2022.
//

import UIKit

final class ExplorerCollectionHeaderView: UICollectionReusableView {
    
    static let id = String(describing: ExplorerCollectionHeaderView.self)
    
    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    
    var leftText: String? {
        get {
            return nil
        }
        set {
            leftLabel.text = newValue
        }
    }
    
    var rightText: String? {
        get {
            return nil
        }
        set {
            rightLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        
        leftLabel.textAlignment = .left
        leftLabel.textColor = .black
        
        rightLabel.textAlignment = .right
        rightLabel.textColor = .orange
        
        addSubview(leftLabel)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            leftLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(rightLabel)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
