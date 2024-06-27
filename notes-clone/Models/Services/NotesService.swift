//
//  NotesService.swift
//  notes-clone
//
//  Created by Anne Auzier on 24/06/24.
//

import CloudKit

class NotesService: NotesServiceProtocol {

    private let database = CKContainer(identifier: "iCloud.NotesCloud").publicCloudDatabase

    func getNotes() throws -> [Note] {
        let query = CKQuery(recordType: "NotesData", predicate: NSPredicate(value: true))
        var fetchedNotes: [Note] = []
        let semaphore = DispatchSemaphore(value: 0)
        
        return fetchedNotes
    }
    
    func createNote(_ note: Note) throws {
        let record = CKRecord(recordType: "NotesData")
        record["title"] = note.title as CKRecordValue
        record["description"] = note.description as CKRecordValue
        
        database.save(record) { _, error in
            if let error = error {
                print(error.localizedDescription )
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


//
//import Foundation
//import CloudKit
//
//final class NotesService: NotesServiceProtocol {
//    
//    private let container: CKContainer
//    private let publicDatabase: CKDatabase
//    
//    init() {
//        self.container = CKContainer.default()
//        self.publicDatabase = container.publicCloudDatabase
//    }
//    

//    func createNote(_ note: Note) throws {
//        let record = note.toCKRecord()
//        let semaphore = DispatchSemaphore(value: 0)
//        
//        publicDatabase.save(record) { record, error in
//            if let error = error {
//                print("Error saving note: \(error)")
//            }
//            semaphore.signal()
//        }
//        
//        _ = semaphore.wait(timeout: .distantFuture)
//    }
//    
//    func editNote(_ note: Note) throws {
//        let recordID = CKRecord.ID(recordName: note.id.uuidString)
//        let semaphore = DispatchSemaphore(value: 0)
//        
//        publicDatabase.fetch(withRecordID: recordID) { record, error in
//            if let error = error {
//                print("Error fetching note to edit: \(error)")
//                semaphore.signal()
//                return
//            }
//            
//            if let record = record {
//                record["title"] = note.title as CKRecordValue
//                record["description"] = note.description as CKRecordValue
//                
//                self.publicDatabase.save(record) { record, error in
//                    if let error = error {
//                        print("Error saving edited note: \(error)")
//                    }
//                    semaphore.signal()
//                }
//            } else {
//                semaphore.signal()
//            }
//        }
//        
//        _ = semaphore.wait(timeout: .distantFuture)
//    }
//    
//    func deleteNote(by id: UUID) throws {
//        let recordID = CKRecord.ID(recordName: id.uuidString)
//        let semaphore = DispatchSemaphore(value: 0)
//        
//        publicDatabase.delete(withRecordID: recordID) { recordID, error in
//            if let error = error {
//                print("Error deleting note: \(error)")
//            }
//            semaphore.signal()
//        }
//        
//        _ = semaphore.wait(timeout: .distantFuture)
//    }
//}


//    func getNotes() throws -> [Note] {
//        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
//        var fetchedNotes: [Note] = []
//        let semaphore = DispatchSemaphore(value: 0)
//
//        publicDatabase.perform(query, inZoneWith: nil) { records, error in
//            if let error = error {
//                print("Error fetching notes: \(error)")
//                semaphore.signal()
//                return
//            }
//
//            if let records = records {
//                fetchedNotes = records.map { Note(record: $0) }
//            }
//            semaphore.signal()
//        }
//
//        _ = semaphore.wait(timeout: .distantFuture)
//        return fetchedNotes
//    }
//
