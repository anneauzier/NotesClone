//
//  WriteNote.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

class WriteNote: UIView {
    
    lazy var titleView: UITextView = {
        let title = UITextView()
        title.font = UIFont.preferredFont(forTextStyle: .title1)
        return title
    }()
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.font = UIFont.preferredFont(forTextStyle: .body)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WriteNote: ViewCodeProtocol {
    func addSubviews() {
        self.addSubview(titleView)
        self.addSubview(textView)
    }
    
    func setupConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
            textView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor)
        ])
    }
}
