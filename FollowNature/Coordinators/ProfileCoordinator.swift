//
//  ProfileCoordinator.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator
import UIKit
import SwiftUI

enum SettingsRoute: Route {
    case settings
}

class SettingsCoordinator: NavigationCoordinator<SettingsRoute> {
    
    init() {
        super.init(initialRoute: .settings)
    }
    
    override func prepareTransition(for route: SettingsRoute) -> NavigationTransition {
        switch route {
            
        case .settings:
            return .push(buildSettingsScreen())
        }
    }
    
    private func buildSettingsScreen() -> UIViewController {
        let viewModel = SettingsViewModel(router: unownedRouter)
        let rootView = SettingsScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
