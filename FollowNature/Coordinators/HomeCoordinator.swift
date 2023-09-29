//
//  HomeCoordinator.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator
import UIKit
import SwiftUI

enum HomeRoute: Route {
    case home
    case jistify
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
            
        case .home:
            return .push(buildHomeScreen())
        case .jistify:
            return .push(buildJustifyScreen())
        }
    }
    
    // MARK: - Build Screens
    private func buildHomeScreen() -> UIViewController {
        let viewModel = HomeViewModel(router: unownedRouter)
        let rootView = HomeScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
    
    private func buildJustifyScreen() -> UIViewController {
        let viewModel = HomeViewModel(router: unownedRouter)
        let rootView = JustifyScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
