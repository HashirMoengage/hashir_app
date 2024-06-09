//
//  HomePageViewController.swift
//  hashir_app
//
//  Created by Hashir Yameen on 22/05/24.
//

import UIKit
import MoEngageSDK
import MoEngageInApps
import MoEngageCards

class HomePageViewController: UIViewController , MoEngageInAppNativeDelegate {
    func inAppShown(withCampaignInfo inappCampaign: MoEngageInApps.MoEngageInAppCampaign, forAccountMeta accountMeta: MoEngageCore.MoEngageAccountMeta) {
        print("InApp Shown Callback for Campaign")
    }
    
    func inAppClicked(withCampaignInfo inappCampaign: MoEngageInApps.MoEngageInAppCampaign, andNavigationActionInfo navigationAction: MoEngageInApps.MoEngageInAppNavigationAction, forAccountMeta accountMeta: MoEngageCore.MoEngageAccountMeta) {
        print("InApp Clicked with Campaign")
    }
    
    func inAppClicked(withCampaignInfo inappCampaign: MoEngageInApps.MoEngageInAppCampaign, andCustomActionInfo customAction: MoEngageInApps.MoEngageInAppAction, forAccountMeta accountMeta: MoEngageCore.MoEngageAccountMeta) {
        print("InApp Clicked with Campaign")
    }
    
    func inAppDismissed(withCampaignInfo inappCampaign: MoEngageInApps.MoEngageInAppCampaign, forAccountMeta accountMeta: MoEngageCore.MoEngageAccountMeta) {
        print("InApp Dismissed Callback for Campaign")
    }
    
    func selfHandledInAppTriggered(withInfo inappCampaign: MoEngageInApps.MoEngageInAppSelfHandledCampaign, forAccountMeta accountMeta: MoEngageCore.MoEngageAccountMeta) {
        print("Self-handled inapp")
    }
    

    @IBOutlet weak var BuyNow: UIButton!
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MoEngageSDKAnalytics.sharedInstance.trackEvent("Cart/Home Viewed", withProperties: nil)
        
        MoEngageSDKAnalytics.sharedInstance.trackEvent("Profile Viewed", withProperties: nil)
        
        MoEngageSDKInApp.sharedInstance.showInApp();
        MoEngageSDKInApp.sharedInstance.setInAppDelegate(self)
    }
    

    @IBAction func BuyNow1_clicked(_ sender: Any) {
        
        var eventAttrDict : Dictionary<String,Any> = Dictionary()
        eventAttrDict["product_name"] = "Hashira Figurine"
        eventAttrDict["price"] = 1200
        eventAttrDict["currency"] = "Rupees"
        let eventProperties = MoEngageProperties(withAttributes: eventAttrDict)
        eventProperties.addDateAttribute(Date(), withName: "time_of_purchase")
        
        eventProperties.addAttribute(1, withName: "total_item")
        
        MoEngageSDKAnalytics.sharedInstance.trackEvent("item_purchased", withProperties: eventProperties)
    }
    
    
    @IBAction func LogoutClicked(_ sender: Any) {
        
        MoEngageSDKAnalytics.sharedInstance.resetUser()
        self.navigationController!.viewControllers.removeAll()
    }
    
    
    @IBAction func CardsClicked(_ sender: Any) {
        
        // To Push MoEngageCardsListViewController
        MoEngageSDKCards.sharedInstance.pushCardsViewController(toNavigationController: self.navigationController!)
         
        // To Present MoEngageCardsListViewController
        //MoEngageSDKCards.sharedInstance.presentCardsViewController()
        
        MoEngageSDKCards.sharedInstance.getCardsViewController(withUIConfiguration: nil, withCardsViewControllerDelegate: nil, forAppID: "3VR8WLDC2GU19AFN4RSEA8UE") { cardsController in
         print("fetched CardsController")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}
