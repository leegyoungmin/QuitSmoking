//
//  SceneDelegate.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let controller = ViewController()
        window?.rootViewController = controller
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

