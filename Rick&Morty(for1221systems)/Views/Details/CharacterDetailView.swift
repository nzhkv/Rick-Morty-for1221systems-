//
//  CharacterDetailView.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 20.08.2023.
//

import UIKit

class CharacterDetailView: UIView {
    
    
    private let viewModel: CharacterDetailViewViewModel
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.cellIdentifier)
        return table
    }()
    
    init(frame: CGRect, viewModel: CharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addConstraints()
        setUpTableView()
        tableView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpTableView() {
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    

}
