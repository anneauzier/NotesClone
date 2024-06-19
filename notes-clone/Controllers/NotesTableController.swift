//
//  NotesTableController.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import UIKit

class NotesTableController: UIViewController {

    let notesView = NotesTable()

    override func loadView() {
        view = notesView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self
    }

}

extension NotesTableController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableCell.reuseIdentifier, for: indexPath)
        
        guard let cell = cell as? NotesTableCell else {
            let cell = NotesTableCell()
            cell.title.text = "Example Title"
            return cell
        }
        
        cell.title.text = "Titulo da Nota"
        cell.subtitle.text = "Subtitulo da nota"
        
        return cell
    }
}
