//
//  NoteController.swift
//  notes-clone
//
//  Created by Anne Auzier on 20/06/24.
//

import Foundation
import CloudKit

final class NoteController {
    private let service: NotesServiceProtocol

    init(service: NotesServiceProtocol) {
        self.service = service
    }

    // TODO: Fazer tratamento de erro
    func getNotes(completion: @escaping ([Note]?, Error?) -> Void) {
        service.getNotes { notes, error in
            if error == nil {
                completion(notes, nil)
            } else {
                completion(nil, error)
            }
        }
    }

    func createNote(_ note: Note) {
        do {
            return try service.createNote(note)
        } catch {
            print(error.localizedDescription)
        }
    }

    func editNote(_ note: Note) {
        do {
            return try service.editNote(note)
        } catch {
            print(error.localizedDescription)
        }
    }

    func deleteNote(by id: CKRecord.ID ) {
        do {
            return try service.deleteNote(by: id) { error in
                if let error = error {
                    print("Erro ao deletar nota \(error.localizedDescription)")
                } else {
                    print("Nota deletada")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
