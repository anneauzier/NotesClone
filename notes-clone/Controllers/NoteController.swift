//
//  NoteController.swift
//  notes-clone
//
//  Created by Anne Auzier on 20/06/24.
//

import Foundation

final class NoteController {
    private let service: NotesServiceProtocol
    
    init(service: NotesServiceProtocol) {
        self.service = service
    }
    
    // TODO: Fazer tratamento de erro

    func getNote() -> [Note] {
        do {
            return try service.getNotes()
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func createNote(_ note: Note) throws {
        do {
            return try service.createNote(note)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editNote(_ note: Note) throws {
        do {
            return try service.editNote(note)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote(by id: UUID) throws {
        do {
            return try service.deleteNote(by: id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
