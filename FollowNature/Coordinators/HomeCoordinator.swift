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
    case jistify([FormdataSuggestion])
    case details(FormdataSuggestion)
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
            
        case .home:
            return .push(buildHomeScreen())
        case .jistify(let plants):
            return .push(buildJustifyScreen(plants: plants))
        case .details(let details):
            return .push(buildDetailScreen(plant: details))
        }
    }
    
    // MARK: - Build Screens
    private func buildHomeScreen() -> UIViewController {
        let viewModel = HomeViewModel(router: unownedRouter)
        let rootView = HomeScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
    
    private func buildJustifyScreen(plants: [FormdataSuggestion]) -> UIViewController {
        let viewModel = JustifyViewModel(plants: plants, router: unownedRouter)
        let rootView = JustifyScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
    
    private func buildDetailScreen(plant: FormdataSuggestion) -> UIViewController {
        let viewModel = PlantDetailViewModel(plant: plant, router: unownedRouter)
        let rootView = PlantDetailScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
