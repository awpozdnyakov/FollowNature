//
//  NotepadCoordinator.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator
import UIKit
import SwiftUI

enum NotepadRoute: Route {
    case notepad
    case details(FormdataSuggestion, Bool)
}

class NotepadCoordinator: NavigationCoordinator<NotepadRoute> {
    
    init() {
        super.init(initialRoute: .notepad)
    }
    
    override func prepareTransition(for route: NotepadRoute) -> NavigationTransition {
        switch route {
            
        case .notepad:
            return .push(buildNotepadScreen())
        case .details(let details, let selected):
            return .push(buildDetailScreen(plant: details, selected: selected))
        }
    }
    
    private func buildNotepadScreen() -> UIViewController {
        let viewModel = NotepadViewModel(router: unownedRouter)
        let rootView = NotepadScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
    
    private func buildDetailScreen(plant: FormdataSuggestion, selected: Bool) -> UIViewController {
        let viewModel = PlantDetailViewModel(plant: plant, selected: selected, router: unownedRouter)
        let rootView = PlantDetailScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
