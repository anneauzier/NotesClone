//
//  WriteNoteController.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

final class WriteNoteController: UIViewController {

    let writeNoteView = WriteNote()

    let note: Note
    let coordinator: Coordinator
    let notesController: NoteController
    
    var isThisNewNote: Bool

    init(note: Note, coordinator: Coordinator, notesController: NoteController) {
        self.note = note
        self.coordinator = coordinator
        self.notesController = notesController
        self.isThisNewNote = note.title.isEmpty && note.description.isEmpty

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = writeNoteView
        
        isThisNewNote ? notesController.createNote(note) : notesController.editNote(note)
    }
}


