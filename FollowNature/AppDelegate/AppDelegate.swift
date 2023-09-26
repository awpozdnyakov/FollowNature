//
//  AppDelegate.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initAppearance()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

extension AppDelegate {
    
    private func initAppearance() {
        
        //TODO: Not working
        UITabBar.appearance().itemWidth = 100
        UITabBar.appearance().tintColor = UIColor(Asset.Colors.green.swiftUIColor)
        UITabBar.appearance().unselectedItemTintColor = .green
    }
}
