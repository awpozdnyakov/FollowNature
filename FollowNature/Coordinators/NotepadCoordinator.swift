//
//  NotepadCoordinator.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator
import UIKit

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
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            return .push(viewController)
        }
    }
}
