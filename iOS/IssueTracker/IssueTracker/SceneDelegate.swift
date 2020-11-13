//
//  SceneDelegate.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/10/29.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let user = SceneDelegate.user
        let identifier = user != nil ? "MainTabBarController" : String(describing: LoginViewController.self)
        let storyBoardName = user != nil ? "Main" : "Login"
        
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let rootViewController = storyboard.instantiateViewController(identifier: identifier)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    static var user: User? {
        guard
            let data  = UserDefaults.standard.data(forKey: "user"),
            let decodedUser = try? PropertyListDecoder().decode(User.self, from: data)
                as? User
            else { return nil }
        return decodedUser
    }
    
}

