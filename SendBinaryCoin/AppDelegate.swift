//
//  AppDelegate.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let view = UIViewController()
        view.view.backgroundColor = .red
        window?.rootViewController = UINavigationController(rootViewController: view)
        window?.makeKeyAndVisible()
        return true
    }
}

