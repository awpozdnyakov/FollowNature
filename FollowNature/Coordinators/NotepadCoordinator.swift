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
}

class NotepadCoordinator: NavigationCoordinator<NotepadRoute> {
    
    init() {
        super.init(initialRoute: .notepad)
    }
    
    override func prepareTransition(for route: NotepadRoute) -> NavigationTransition {
        switch route {
            
        case .notepad:
            return .push(buildNotepadScreen())
        }
    }
    private func buildNotepadScreen() -> UIViewController {
        let viewModel = NotepadViewModel(router: unownedRouter)
        let rootView = NotepadScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
