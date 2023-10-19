//
//  MainTabBarCoordinator.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import XCoordinator
import UIKit

enum TabBarRoute: Route {
    case home
}

class MainTabBarCoordinator: TabBarCoordinator<TabBarRoute> {
    private let homeRouter: StrongRouter<HomeRoute>
    private let notepadRouter: StrongRouter<NotepadRoute>
    private let settingsRouter: StrongRouter<SettingsRoute>
    
    convenience init() {
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(dynamicProvider: Asset.Colors.greenLight.color)
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "camera.macro"), tag: 0)
        
        let notepadCoordinator = NotepadCoordinator()
        notepadCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let settingsCoordinator = SettingsCoordinator()
        settingsCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape"), tag: 2)
        
        self.init(
            homeRouter: homeCoordinator.strongRouter,
            notepadRouter: notepadCoordinator.strongRouter,
            settingsRouter: settingsCoordinator.strongRouter
        )
    }
    
    init(
        homeRouter: StrongRouter<HomeRoute>,
        notepadRouter: StrongRouter<NotepadRoute>,
        settingsRouter: StrongRouter<SettingsRoute>
    ) {
        self.homeRouter = homeRouter
        self.notepadRouter = notepadRouter
        self.settingsRouter = settingsRouter
        super.init(tabs: [homeRouter, notepadRouter, settingsRouter],select: homeRouter)
        rootViewController.view.backgroundColor = .white
    }
}
