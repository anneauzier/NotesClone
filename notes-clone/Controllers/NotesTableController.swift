//
//  NotesTableController.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import UIKit

class NotesTableController: UIViewController {

    let notesView = NotesTable()
    let coordinator: Coordinator
    private let notesController: NoteController
    
    init(notesController: NoteController, coordinator: Coordinator) {
        self.notesController = notesController
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = notesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Notes"

        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self

        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension NotesTableController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesController.getNote().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableCell.reuseIdentifier, for: indexPath)
        let getTitles = notesController.getNote().map({ $0.title })
        let getSubtitles = notesController.getNote().map({ $0.description })
        
        guard let cell = cell as? NotesTableCell else {
            let cell = NotesTableCell()
            cell.title.text = "Example Title"
            return cell
        }
        
        cell.title.text = getTitles[indexPath.row]
        cell.subtitle.text = getSubtitles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        let note = notesController.getNote()[indexPath.row]
        coordinator.show(.writeNote(notesController, note))
    }
}
