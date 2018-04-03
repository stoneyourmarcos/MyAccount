//
//  AppDelegate.swift
//  MyAccounts
//
//  Created by Marcos Contente on 23/03/18.
//  Copyright © 2018 brq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Appearance.setGlobalAppearance()
        let initialController = window?.rootViewController as! UINavigationController
        let accountsController = initialController.viewControllers.first as! AccountsViewController
        accountsController.stateController = StateController(storageController: StorageController())
        return true
    }
    
    struct Appearance {
        static func setGlobalAppearance() {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .skyBlue
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    }
}

