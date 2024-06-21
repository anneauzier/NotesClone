//
//  CoordinatorManager.swift
//  notes-clone
//
//  Created by Anne Auzier on 21/06/24.
//

import UIKit

// MARK: É só para treinar o Coordinator Pattern mesmo hahaha

protocol NavigationRouter {
    var transition: NavigationTransitionStyle { get }
    func viewController(coordinator: Coordinator) -> UIViewController
}

enum NavigationTransitionStyle {
    case push
}

final class Coordinator {

    private let root: NoteRouter
    let navigationController: UINavigationController
    
    init(root: NoteRouter, navigationController: UINavigationController = .init()) {
        self.root = root
        self.navigationController = navigationController
    }
    
    func start() {
        show(root)
    }
    
    func show(_ route: NoteRouter, animated: Bool = true) {
        switch route.transition {
        case .push:
            navigationController.pushViewController(route.viewController(coordinator: self), animated: animated)
        }
    }
}

