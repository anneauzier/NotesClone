//
//  NoteRouter.swift
//  notes-clone
//
//  Created by Anne Auzier on 24/06/24.
//

import UIKit

protocol NavigationRouter {
    var transition: NavigationTransitionStyle { get }
    func viewController(coordinator: Coordinator) -> UIViewController
}

enum NavigationTransitionStyle {
    case push
    // sheet, fullsheet
}

enum NoteRouter: NavigationRouter {
    case notes(NoteController)
    case writeNote(NoteController, Note = .init())
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .notes:
            return .push
            
        case .writeNote:
            return .push
        }
    }
    
    func viewController(coordinator: Coordinator) -> UIViewController {
        switch self {
        case .notes(let noteController):
            return NotesTableController(notesController: noteController, coordinator: coordinator)
        
        case .writeNote(let noteController, let note):
            return WriteNoteController(note: note, coordinator: coordinator, notesController: noteController)
        }
    }
}

