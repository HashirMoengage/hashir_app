//
//  ViewController.swift
//  hashir_app
//
//  Created by Hashir Yameen on 20/05/24.
//

import UIKit
import MoEngageSDK

class ViewController: UIViewController {

    @IBOutlet weak var first_name_tf: UITextField!
    
    @IBOutlet weak var last_name_tf: UITextField!
    
    
    @IBOutlet weak var email_tf: UITextField!
    
    
    @IBOutlet weak var gender_tf: UITextField!
    
    @IBOutlet weak var language_tf: UITextField!
    
    @IBOutlet weak var phone_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "registerButton", sender: sender)
        
        MoEngageSDKAnalytics.sharedInstance.setUniqueID(email_tf.text ?? "Anonymous")
//        MoEngageSDKAnalytics.sharedInstance.setName(userName)
        MoEngageSDKAnalytics.sharedInstance.setLastName(last_name_tf.text ?? "User")
        MoEngageSDKAnalytics.sharedInstance.setFirstName(first_name_tf.text ?? "User")
        MoEngageSDKAnalytics.sharedInstance.setEmailID(email_tf.text ?? "Email")
        MoEngageSDKAnalytics.sharedInstance.setMobileNumber(phone_tf.text ?? "+91")
//        MoEngageSDKAnalytics.sharedInstance.setGender(gender_tf.text)
//        ireference")
        
        MoEngageSDKAnalytics.sharedInstance.trackEvent("user_registered", withProperties: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "registerButton"{
            
            if let tabBarController = segue.destination as? UITabBarController{
                
                if let destination =
                    tabBarController.viewControllers?[0] as?
                    ProfilePageViewController{
                    destination.firstName = first_name_tf.text
                    
                    destination.lastName =
                    last_name_tf.text
                    
                    destination.email =
                    email_tf.text
                    
                    destination.langPref =
                    language_tf.text
                    
                    destination.phoneNumber =
                    phone_tf.text
                }
                
                tabBarController.selectedIndex = 0
                //print("Done")
            }
        }
    }
}

