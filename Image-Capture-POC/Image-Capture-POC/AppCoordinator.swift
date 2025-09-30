//
//  AppCoordinator.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import UIKit

final class AppCoordinator {
    private var coordinatorRegister: [AppTransition: Coordinator] = [:]
    
    lazy var navigationController: UINavigationController? = {
        .init()
    }()
}

// MARK: - Router

extension AppCoordinator: AppRouter {
    func process(_ route: AppTransition) {
        debugPrint("Processing route: \(route.rawValue)")
        let coordinator = coordinatorRegister[route] ?? route.coordinator(for: self)
        coordinatorRegister[route] = coordinator
        coordinator.start()
    }
}

// MARK: - Coordinator

extension AppCoordinator: Coordinator {
    func start() {
        process(.showHome)
    }
    
    func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
}
