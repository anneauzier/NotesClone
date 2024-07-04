//
//  WriteNote.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

class WriteNote: UIView {
    
    lazy var titleView: UITextField = {
        let title = UITextField()
        title.font = UIFont.preferredFont(forTextStyle: .title1)
        title.placeholder = "Title"
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupAdditionalConfiguration()
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
            titleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            textView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
    }
}
