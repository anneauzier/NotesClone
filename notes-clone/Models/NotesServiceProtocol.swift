//
//  NotesServiceProtocol.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation

protocol NotesServiceProtocol {
    func getNotes(completion: @escaping ([Note]?, Error?) -> Void)
    func createNote(_ note: Note) throws
    func editNote(_ note: Note) throws
    func deleteNote(by id: UUID) throws
}
