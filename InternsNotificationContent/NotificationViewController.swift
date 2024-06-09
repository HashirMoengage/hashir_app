//
//  NotificationViewController.swift
//  InternsNotificationContent
//
//  Created by Hashir Yameen on 04/06/24.
//

//import UIKit
//import UserNotifications
//import UserNotificationsUI
//
//class NotificationViewController: UIViewController, UNNotificationContentExtension {
//
//    @IBOutlet var label: UILabel?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any required interface initialization here.
//    }
//    
//    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
//    }
//
//}

import UIKit
import UserNotifications
import UserNotificationsUI
import MoEngageRichNotification
class NotificationViewController: UIViewController, UNNotificationContentExtension {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Set App Group ID
    MoEngageSDKRichNotification.setAppGroupID("group.com.moengage.MIPL567.demo.moengage")
  }
  func didReceive(_ notification: UNNotification) {
    // Method to add template to UI
    MoEngageSDKRichNotification.addPushTemplate(toController: self, withNotification: notification)
  }
}
