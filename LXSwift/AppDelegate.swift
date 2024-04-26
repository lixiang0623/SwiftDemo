//
//  AppDelegate.swift
//  LXSwift
//
//  Created by 李祥 on 2024/4/1.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initWindow()
        AppDelegate_configIQKeyboardManager()
        return true
    }
    
    
    func initWindow(){
        self.window = UIWindow.init()
        self.window?.backgroundColor = UIColor.white
        self.window?.frame = UIScreen.main.bounds
        //
        
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = BaseTabBarController()
        
        
        
        
    }
    // MARK: - 键盘处理
    func AppDelegate_configIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true //工具条
        IQKeyboardManager.shared.resignOnTouchOutside = true //点击背景收回键盘
//        IQKeyboardManager.shared.toolbarConfiguration.doneBarButtonConfiguration?.title = "完成"
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = true
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = false
        IQKeyboardManager.shared.toolbarConfiguration.tintColor = .lightGray
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5.0
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

