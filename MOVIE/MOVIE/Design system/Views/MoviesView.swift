//
//  Movies.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import UIKit

final class MoviesView: UIView {
    
    // MARK: - Public
    
    // MARK: Variables
    
    var onSelectItem: ((Int) -> Void)?
    
    // MARK: UI
    
    let tableView = UITableView()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        setupTableView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableViewDataSource

extension MoviesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "dsakdka"
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MoviesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectItem?(1)
    }
    
}

// MARK: - Private functions

private extension MoviesView {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = AppColors.background
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: Layout
    
    func setupLayout() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
