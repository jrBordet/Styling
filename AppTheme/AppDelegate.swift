//
//  AppDelegate.swift
//  AppTheme
//
//  Created by Jean Raphael Bordet on 22/05/2020.
//  Copyright © 2020 Jean Raphael Bordet. All rights reserved.
//

import SceneBuilder
import Caprice

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
        let rootScene = Scene<ViewController>().render()
                    
        self.window?.rootViewController = UINavigationController(rootViewController: rootScene)
        
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .white
        
        func incr(_ x: Int) -> Int {
            x + 1
        }
        
        let result = 1 |> incr
        print(result)
        
        return true
    }
}
