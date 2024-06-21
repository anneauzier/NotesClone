//
//  NoteRouter.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

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
            case .notes(let controller):
            return NotesTableController(notesController: controller, coordinator: coordinator)
            case .writeNote(let controller, let note):
                return WriteNoteController()
        }
    }
}
