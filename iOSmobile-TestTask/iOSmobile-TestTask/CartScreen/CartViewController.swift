//
//  File.swift
//  iOSmobile-TestTask
//
//  Created by pavel mishanin on 08.12.2022.
//

import UIKit

final class CartViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let backgroundView = UIView()
    private let rightBarButtonView = CartRightBarButtonView()
    private let checkoutButtonView = TextView(backgroundColor: .orange,
                                              textColor: .white,
                                              text: "Checkout", cornerRadius: 10)
    private let totalView = CartTotalView()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .clear
//        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CartTableCell.self,
                                forCellReuseIdentifier: CartTableCell.id)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        
        titleLabel.text = "My Cart"
        titleLabel.textAlignment = .left
        
//        checkoutButtonView.layer.cornerRadius = 10
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
        
        backgroundView.backgroundColor = .darkGray
        backgroundView.layer.cornerRadius = 20
        backgroundView.clipsToBounds = true
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        
        
        view.addSubview(checkoutButtonView)
        checkoutButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkoutButtonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            checkoutButtonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            checkoutButtonView.heightAnchor.constraint(equalToConstant: 50),
            checkoutButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        view.addSubview(totalView)
        totalView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            totalView.heightAnchor.constraint(equalToConstant: 100),
            totalView.bottomAnchor.constraint(equalTo: checkoutButtonView.topAnchor, constant: -20),
        ])
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: totalView.topAnchor, constant: -20),
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButtonView)
        
        navigationItem.setHidesBackButton(true, animated:false)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.backgroundColor = .red
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        
        
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CartTableCell.id,
            for: indexPath) as? CartTableCell
        else { return UITableViewCell() }
        
        return cell
    }
}

final class CartRightBarButtonView: UIView {
    
    private let textLabel = UILabel()
    private let backView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        textLabel.text = "Add address"
        textLabel.textAlignment = .right
        
        backView.backgroundColor = .orange
        
        addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            backView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            backView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backView.widthAnchor.constraint(equalToConstant: 40),
            backView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.trailingAnchor.constraint(equalTo: backView.leadingAnchor, constant: -5),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
