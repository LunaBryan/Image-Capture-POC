//
//  HistoryCoordinator.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import SwiftUI

final class HistoryCoordinator<Router: AppRouter> {
    
    private let router: Router
    
    var navigationController: UINavigationController { router.navigationController }
    
    private lazy var primaryViewController: UIViewController = {
        let view = HistoryListView()
        let viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    init(router: Router) {
        self.router = router
    }
}

// MARK: - Coordinator

extension HistoryCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(primaryViewController, animated: true)
    }
}

// MARK: - Router

extension HistoryCoordinator: HistoryRouter {
    func process(route: HistoryTransition) {
        // TODO: - Handle history flow
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}
