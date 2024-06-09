//
//  AppDelegate.swift
//  hashir_app
//
//  Created by Hashir Yameen on 20/05/24.
//

import UIKit
import MoEngageSDK
import MoEngageRealTimeTrigger
//import MoEngageCore
//import MoEngageInApps
// Add the below line to show inapp


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let sdkConfig = MoEngageSDKConfig(appId: "3VR8WLDC2GU19AFN4RSEA8UE", dataCenter: .data_center_03);
        
        sdkConfig.appGroupID = "group.com.moengage.MIPL567.demo.moengage"
        
        sdkConfig.consoleLogConfig = MoEngageConsoleLogConfig(isLoggingEnabled: true, loglevel: .verbose)
        
       
        
        //MoEngageSDKMessaging.sharedInstance.setMessagingDelegate(self)
    
        
//            MoEngageSDKInApp.sharedInstance.showInApp()
         
              // MoEngage SDK Initialization
              // Separate initialization methods for Dev and Prod initializations
              #if DEBUG
                  MoEngage.sharedInstance.initializeDefaultTestInstance(sdkConfig)
              #else
                 MoEngage.sharedInstance.initializeDefaultLiveInstance(sdkConfig)
              #endif
         
          //Rest of the implementation of method
          //-------
        
        UNUserNotificationCenter.current().delegate = self
        
        MoEngageSDKMessaging.sharedInstance.registerForRemoteNotification(withCategories: nil, andUserNotificationCenterDelegate: self) // notification
        
        MoEngageSDKMessaging.sharedInstance.disableBadgeReset(true)

          
        return true
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
  //Call only if MoEngageAppDelegateProxyEnabled is NO
        MoEngageSDKMessaging.sharedInstance.setPushToken(deviceToken)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    

}

