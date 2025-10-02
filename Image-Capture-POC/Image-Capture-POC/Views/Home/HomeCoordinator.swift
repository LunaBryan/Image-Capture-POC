//
//  HomeCoordinator.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import SwiftUI

final class HomeCoordinator<Router: AppRouter> {
    
    private let router: Router
    
    var navigationController: UINavigationController { router.navigationController }
    
    private lazy var primaryViewController: UIViewController = {
        let view = HomeView(router: self)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    init(router: Router) {
        self.router = router
    }
}

// MARK: - Coordinator

extension HomeCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(primaryViewController, animated: true)
    }
}

// MARK: - Router

extension HomeCoordinator: HomeRouter {
    func process(route: HomeTransition) {
        switch route {
            case .showHistory:
                router.process(route: .showHistory)
        }
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}
