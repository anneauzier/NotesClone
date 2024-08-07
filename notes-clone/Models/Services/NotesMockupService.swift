//
//  NotesMockupService.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation
import CloudKit

final class NotesMockupService: NotesServiceProtocol {

    var notes: [Note] = []
    
    init() {
        for i in 0..<10 {
            notes.append(Note(title: "Lorem Ipsum \(i)", description: "Is simply dummy text of the printing and typesetting industry"))
        }
    }

    func getNotes(completion: @escaping ([Note]?, (any Error)?) -> Void) {
        completion(notes, nil)
    }

    func createNote(_ note: Note) throws {
        notes.append(note)
    }
    
    func editNote(_ note: Note) throws {
        guard let noteIndex = notes.firstIndex(where: { $0.id == note.id }) else { return }
        notes[noteIndex] = note
    }

    func deleteNote(by id: CKRecord.ID, completion: @escaping ((any Error)?) -> Void) throws {
        //
    }

//    func deleteNote(by id: UUID) throws {
//        guard let index = notes.firstIndex(where: { $0.id == id }) else { return }
//        notes.remove(at: index)
//    }
}
