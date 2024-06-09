//
//  ProfilePageViewController.swift
//  hashir_app
//
//  Created by Hashir Yameen on 21/05/24.
//

import UIKit
import MoEngageSDK
//import MoEngageInApps

class ProfilePageViewController: ViewController{
    

    @IBOutlet weak var first_name_label: UILabel!
    
    
    @IBOutlet weak var last_name_label: UILabel!
    
    
    @IBOutlet weak var email_label: UILabel!
    
    @IBOutlet weak var langLabel: UILabel!
    
    @IBOutlet weak var phone_label: UILabel!
    
    var firstName:String?
    var lastName:String?
    var email:String?
    var langPref:String?
    var phoneNumber:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let my_first_name = firstName {
            first_name_label.text = my_first_name
        }
        
        if let my_last_name = lastName {
            last_name_label.text =  my_last_name
        }
        
        if let my_email = email{
            email_label.text = my_email
        }
        
        if let my_lang_preference = langPref{
            langLabel.text = my_lang_preference
        }
        
        if let my_phone_number = phoneNumber{
            phone_label.text = my_phone_number
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
