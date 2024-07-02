//
//  Note.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation

class Note {
    let id: UUID = .init()
    let date: Date = .init()
    
    var title: String
    var description: String
    
    init(title: String = "", description: String = "") {
        self.title = title
        self.description = description
    }
}

