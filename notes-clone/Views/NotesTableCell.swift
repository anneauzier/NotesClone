//
//  NotesTableCell.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import UIKit

final class NotesTableCell: UITableViewCell {

   static let reuseIdentifier = "notes-cell"
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.preferredFont(forTextStyle: .title2)
        title.font = UIFont.boldSystemFont(ofSize: title.font.pointSize)
        return title
    }()

    lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.preferredFont(forTextStyle: .body)
        subtitle.textColor = .systemGray
        return subtitle
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NotesTableCell: ViewCodeProtocol {
    func addSubviews() {
        self.addSubview(title)
        self.addSubview(subtitle)
    }
    
    func setupConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
