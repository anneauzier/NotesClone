//
//  Note.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation
import CloudKit

class Note {
    var id: CKRecord.ID?
    let date: Date = .init()

    var title: String
    var description: String

    init(title: String = "", description: String = "", id: CKRecord.ID? = nil) {
        self.title = title
        self.description = description
        self.id = id
    }
}

