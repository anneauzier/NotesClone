//
//  CoordinatorManager.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

// MARK: É só para treinar o Coordinator Pattern mesmo hahaha

final class Coordinator {
    private let root: NoteRouter
    let navigationController: UINavigationController
    
    init(root: NoteRouter, navigationController: UINavigationController = .init()) {
        self.root = root
        self.navigationController = navigationController
    }

    func show(_ route: NoteRouter) {
        switch route.transition {
        case .push:
            navigationController.pushViewController(route.viewController(coordinator: self), animated: true)
        }
    }

    func start() {
        self.show(root)
    }
}

