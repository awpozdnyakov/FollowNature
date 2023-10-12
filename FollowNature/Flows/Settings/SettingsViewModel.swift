//
//  SettingsViewModel.swift
//  FollowNature
//
//  Created by Macbook on 09.10.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator
import Moya

final class SettingsViewModel: ObservableObject {
    
    @Published var openDevelopersTable = false
    
    private let router: UnownedRouter<SettingsRoute>

    init(
        router: UnownedRouter<SettingsRoute>
    ) {
        self.router = router
    }
}
