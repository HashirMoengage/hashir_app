//
//  CardListViewController.swift
//  hashir_app
//
//  Created by Hashir Yameen on 23/05/24.
//

import UIKit
import MoEngageCards

class CardListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MoEngageSDKCards.sharedInstance.presentCardsViewController()
        
        
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
