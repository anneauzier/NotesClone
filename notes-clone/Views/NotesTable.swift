//
//  NotesTable.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import UIKit

final class NotesTable: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NotesTable: ViewCode {
    func addSubviews() {
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        // registra uma classe a ser usada na criacao de novas células de tabela
        tableView.register(NotesTableCell.self, forCellReuseIdentifier: NotesTableCell.reuseIdentifier)
    }
}
