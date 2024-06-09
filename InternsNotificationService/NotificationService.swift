//
//  NotificationService.swift
//  InternsNotificationService
//
//  Created by Hashir Yameen on 04/06/24.
//

//import UserNotifications
//
//class NotificationService: UNNotificationServiceExtension {
//
//    var contentHandler: ((UNNotificationContent) -> Void)?
//    var bestAttemptContent: UNMutableNotificationContent?
//
//    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
//        self.contentHandler = contentHandler
//        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
//        
//        if let bestAttemptContent = bestAttemptContent {
//            // Modify the notification content here...
//            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
//            
//            contentHandler(bestAttemptContent)
//        }
//    }
//    
//    override func serviceExtensionTimeWillExpire() {
//        // Called just before the extension will be terminated by the system.
//        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
//        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
//            contentHandler(bestAttemptContent)
//        }
//    }
//
//}

import UserNotifications
//import MoEngageSDK
// 1st Step
import MoEngageRichNotification
class NotificationService: UNNotificationServiceExtension {
  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?
  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
//    let sdkConfig = MoEngageSDKConfig(withAppID: "HW0T6FDRR0WSMVP74P01ZT99")
//    sdkConfig.appGroupID = "group.com.moengage.MIPL567.demo.moengage"
    // 2nd Step
   MoEngageSDKRichNotification.setAppGroupID("group.com.moengage.MIPL567.demo.moengage")
   self.contentHandler = contentHandler
   bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
   // 3rd Step
   MoEngageSDKRichNotification.handle(richNotificationRequest: request, withContentHandler: contentHandler)
  }
  override func serviceExtensionTimeWillExpire() {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }
}
