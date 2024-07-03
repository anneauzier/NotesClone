//
//  Note.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation
import CloudKit

class Note {
    let id: CKRecord.ID? = CKRecord.ID()
    let date: Date = .init()
    
    var title: String
    var description: String
    
    init(title: String = "", description: String = "") {
        self.title = title
        self.description = description
    }
}

