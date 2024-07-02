//
//  NotesService.swift
//  notes-clone
//
//  Created by Anne Auzier on 24/06/24.
//

import CloudKit

class NotesService: NotesServiceProtocol {

    private let database = CKContainer(identifier: "iCloud.NotesCloud").publicCloudDatabase
    var fetchedNotes = [Note]()

    func getNotes(completion: @escaping ([Note]?, (any Error)?) -> Void) {

        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "NotesData", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        
        operation.recordMatchedBlock = { _, result in
            switch result {
            case .success(let record):
                if let title = record["title"] as? String, let description = record["description"] as? String {
                    let note = Note(title: title, description: description)
                    self.fetchedNotes.append(note)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        operation.queryResultBlock = { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cursor):
                    completion(self.fetchedNotes, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
        database.add(operation)
    }

    func createNote(_ note: Note) throws {
        let record = CKRecord(recordType: "NotesData")
        record.setValue(note.title, forKey: "title")
        record.setValue(note.description, forKey: "description")

        database.save(record) { saveRecord, error in
            if error == nil {
                print("Record Save")
            } else {
                print("Record not saved")
            }
        }
    }
    
    func editNote(_ note: Note) throws {
        //
    }
    
    func deleteNote(by id: UUID) throws {
        //
    }
    
}
