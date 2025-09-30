//
//  HistoryCoordinator.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import SwiftUI

final class HistoryCoordinator<Router: AppRouter> {
    
    private let router: Router
    
    lazy var primaryViewController: UIViewController = {
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
        navigationController?.pushViewController(primaryViewController, animated: true)
    }
    
    func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Router

extension HistoryCoordinator: HistoryRouter {
    var navigationController: UINavigationController? { router.navigationController }
    
    func process(_ route: HistoryTransition) {
        // TODO: - Handle history flow
    }
}
