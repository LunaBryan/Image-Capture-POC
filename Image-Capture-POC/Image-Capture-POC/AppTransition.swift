//
//  AppTransition.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

enum AppTransition: String {
    case showHome
    case showHistory
    
    func coordinator<Router: AppRouter>(for router: Router) -> Coordinator {
        switch self {
            case .showHome: HomeCoordinator(router: router)
            case .showHistory: HistoryCoordinator(router: router)
        }
    }
}
