//
//  WriteNoteController.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

final class WriteNoteController: UIViewController {
    
    let writeNoteView = WriteNote()

    override func viewDidLoad() {
        view = writeNoteView
    }
}
