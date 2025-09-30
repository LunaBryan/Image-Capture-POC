//
//  HomeView.swift
//  Image-Capture-POC
//
//  Created by Jose Luna on 9/26/25.
//

import SwiftUI

struct HomeView<Router: HomeRouter>: View {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var body: some View {
        VStack {
            Text("Home view here")
        }
        .toolbar {
            historyButton
        }
    }
    
    private var historyButton: some View {
        Button {
            router.process(.showHistory)
        } label: {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    let appCoordinator = AppCoordinator()
    let homeCoordinator = HomeCoordinator(router: appCoordinator)
    HomeView(router: homeCoordinator)
}
