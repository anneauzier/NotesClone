//
//  Note.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation

struct Note {
    let id: UUID = .init()
    let data: Date = .init()
    
    let title: String
    let description: String
    let isLocket: Bool = false
}
