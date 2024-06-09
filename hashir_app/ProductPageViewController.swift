//
//  ProductPageViewController.swift
//  hashir_app
//
//  Created by Hashir Yameen on 21/05/24.
//

import UIKit
import MoEngageSDK
import MoEngageInApps

class ProductPageViewController: UIViewController {
    
    
    @IBOutlet weak var BuyNow1: UIButton!
    @IBOutlet weak var BuyNow2: UIButton!
    @IBOutlet weak var BuyNow3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        MoEngageSDKInApp.sharedInstance.showNudge(atPosition: NudgePositionTop)
        MoEngageSDKAnalytics.sharedInstance.trackEvent("Product Viewed", withProperties: nil)
    }
    
    @IBAction func BuyNow1_clicked(_ sender: Any) {
        
        var eventAttrDict : Dictionary<String,Any> = Dictionary()
        eventAttrDict["product_name"] = "Hashira Figurine"
        eventAttrDict["price"] = 1200
        eventAttrDict["currency"] = "Rupees"
        let eventProperties = MoEngageProperties(withAttributes: eventAttrDict)
        eventProperties.addDateAttribute(Date(), withName: "time_of_purchase")
        
        MoEngageSDKAnalytics.sharedInstance.trackEvent("add_to_cart", withProperties: eventProperties)
    }
    
    @IBAction func BuyNow2_clicked(_ sender: Any) {
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
