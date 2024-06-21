//
//  Database.swift
//  notes-clone
//
//  Created by Anne Auzier on 20/06/24.
//

import CloudKit

class Database {
    private let database = CKContainer(identifier: "iCloud.NotesCloud").publicCloudDatabase
}
