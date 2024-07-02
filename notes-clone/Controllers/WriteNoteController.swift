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
        super.viewDidLoad()

        writeNoteView.titleView.delegate = self
        writeNoteView.textView.delegate = self
        
        writeNoteView.titleView.text = note.title
        writeNoteView.textView.text = note.description

        view = writeNoteView
    }
    override func viewWillDisappear(_ animated: Bool) {
        saveTitle()
        saveText()

        isThisNewNote ? notesController.createNote(note) : notesController.editNote(note)
    }
    
    func saveTitle() {
        note.title = writeNoteView.titleView.text ?? ""
        
        if note.title.isEmpty {
            note.title = "Untitled"
        }
    }
    
    func saveText() {
        note.description = writeNoteView.textView.text ?? ""
    }
}


extension WriteNoteController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        saveTitle()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        saveText()
    }
}

