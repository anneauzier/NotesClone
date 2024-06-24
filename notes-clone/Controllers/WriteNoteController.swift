//
//  WriteNoteController.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

final class WriteNoteController: UIViewController {
    
    let writeNoteView = WriteNote()
    let coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        view = writeNoteView
    }
}
