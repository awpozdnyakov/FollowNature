//
//  SceneDelegate.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 12.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let mainCoordinator = MainTabBarCoordinator().strongRouter


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { fatalError("No one window scene exist") }
        window = UIWindow(windowScene: windowScene)
        mainCoordinator.setRoot(for: window!)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
   
    }

    func sceneWillResignActive(_ scene: UIScene) {
  
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
 
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    
    }


}

