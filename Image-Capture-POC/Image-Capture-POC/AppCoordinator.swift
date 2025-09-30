//
//  AppCoordinator.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import UIKit

final class AppCoordinator {
    private var coordinatorRegister: [AppTransition: Coordinator] = [:]
    
    private(set) var navigationController: UINavigationController = .init()
}

// MARK: - Coordinator

extension AppCoordinator: Coordinator {
    func start() {
        process(route: .showHome)
    }
}

// MARK: - Router

extension AppCoordinator: AppRouter {
    func process(route: AppTransition) {
        debugPrint("Processing route: \(route.rawValue)")
        let coordinator = coordinatorRegister[route] ?? route.coordinator(for: self)
        coordinatorRegister[route] = coordinator
        coordinator.start()
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}
