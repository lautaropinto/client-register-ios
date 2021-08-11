//
//  ClientListView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit

internal final class ClientListView: UIView {
    let clientsTableView = prepareTableView()
    
    var clients: [Client] = [] {
        didSet {
            self.clientsTableView.reloadData()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ClientListView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        addSubview(clientsTableView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            clientsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            clientsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            clientsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            clientsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setUpAdditionalConfig() {
        clientsTableView.delegate = self
        clientsTableView.dataSource = self
        backgroundColor = .white
    }
}

extension ClientListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClientCell.description()) as? ClientCell else {
            return UITableViewCell()
        }
        
        let textToShow = "\(clients[indexPath.row].name) \(clients[indexPath.row].lastname)"
            
        
        cell.label.text = textToShow
        return cell
    }
}

private func prepareTableView() -> UITableView {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    tableView.bounces = false
    tableView.showsVerticalScrollIndicator = false
    tableView.backgroundColor = .clear
    tableView.register(ClientCell.self, forCellReuseIdentifier: ClientCell.description())
    
    return tableView
}
