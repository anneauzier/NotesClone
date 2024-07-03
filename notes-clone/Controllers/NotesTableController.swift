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

    var notes = [Note]()
    
    init(notesController: NoteController, coordinator: Coordinator) {
        self.notesController = notesController
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func fetchNotes() {
        notesController.getNotes { [weak self] fetchedNotes, error in
            if let error = error {
                print("error \(error.localizedDescription)")
                return
            }
            
            if let fetchedNotes = fetchedNotes {
                DispatchQueue.main.async {
                    self?.notes.removeAll()
                    self?.notes = fetchedNotes
                    self?.notesView.tableView.reloadData()
                    self?.notesView.tableView.refreshControl?.endRefreshing()
                }
            }
        }
    }

    override func loadView() {
        view = notesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Notes"

        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self

        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(fetchNotes), for: .valueChanged)
        notesView.tableView.refreshControl = control

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), 
                                                            style: .plain, target: self, action: #selector(addNewNote))
        
        fetchNotes()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.notesView.tableView.reloadData()
    }

    @objc private func addNewNote() {
        coordinator.show(.writeNote(notesController))
    }
}

extension NotesTableController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableCell.reuseIdentifier, for: indexPath)
        let getTitles = notes.map({ $0.title })
        let getSubtitles = notes.map({ $0.description })
        
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
        let note = notes[indexPath.row]
        coordinator.show(.writeNote(notesController, note))
    }
}

