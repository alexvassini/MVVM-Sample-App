//
//  AppDelegate.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 30/07/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit

import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var defaultContainer: DefaultContainer!
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
//        self.defaultContainer = DefaultContainer()
//
//        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
//        self.appCoordinator = AppCoordinator(window: currentWindow, container: defaultContainer.container)
//        self.appCoordinator?.start()
//        self.window = currentWindow
//        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func verifyOpendURL(_ application: UIApplication, openURL url: URL, options: [UIApplicationOpenURLOptionsKey: Any], annotation: AnyObject?) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        debugPrint(url.scheme, sourceApplication, annotation)
        
        
        if FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation) {
            return true
        }
        
        return false
    }
    
}
