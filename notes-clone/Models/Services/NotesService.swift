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
        
        fetchedNotes.removeAll()

        operation.recordMatchedBlock = { _, result in
            switch result {
            case .success(let record):
                if let title = record["title"] as? String, let description = record["description"] as? String {
                    let note = Note(title: title, description: description, id: record.recordID)
                    self.fetchedNotes.append(note)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        operation.queryResultBlock = { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
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
            if let error = error {
                print("Error saving record: \(error.localizedDescription)")
            } else {
                print("Nota atualizada")
            }
        }
    }
    
    func editNote(_ note: Note) throws {
        guard let recordID = note.id else {
            throw NSError(domain: "NoteErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Record ID is missing"])
        }

        database.fetch(withRecordID: recordID) { record, error in
            guard let record = record, error == nil else {
                if let error = error {
                    print("Erro ao buscar o registro: \(error.localizedDescription)")
                }
                return
            }

            record["title"] = note.title as CKRecordValue
            record["description"] = note.description as CKRecordValue

            self.database.save(record) { saveRecord, saveError in
                DispatchQueue.main.async {
                    if let saveError = saveError {
                        print("Erro ao salvar o registro atualizado: \(saveError.localizedDescription)")
                    } else {
                        print("Nota atualizada com sucesso")
                    }
                }
            }
        }
    }

    func deleteNote(by id: CKRecord.ID, completion: @escaping ((any Error)?) -> Void) throws {
        database.delete(withRecordID: id) { recordID, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Erro ao deletar o registro: \(error.localizedDescription)")
                    completion(error)
                } else {
                    print("Nota deletada com sucesso")
                    completion(nil)
                }
            }
        }
    }
}

//func deleteNote(by id: CKRecord.ID, completion: @escaping (Error?) -> Void) {
//    database.delete(withRecordID: id) { recordID, error in
//        DispatchQueue.main.async {
//            if let error = error {
//                print("Erro ao deletar o registro: \(error.localizedDescription)")
//                completion(error)
//            } else {
//                print("Nota deletada com sucesso")
//                completion(nil)
//            }
//        }
//    }
//}
