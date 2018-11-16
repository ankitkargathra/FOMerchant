//
//  OrderSummaryVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class NotificationSummaryViewController: BaseViewController {
    
    @IBOutlet weak var lblDescription: EPNotificationSuccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDescription.setLineSpacing(lineSpacing: 3.5, lineHeightMultiple: 1.0)
        lblDescription.textAlignment = .center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnListOfNotiFiPressed(_ sender: EPButtonGreenButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "gotonotificationlist"), object: nil)
        
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
               self.dismiss(animated: true,completion: nil)
            })
    }
    
    @IBAction func btnbackToHomePressed(_ sender: EPButtonGreenButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "gotohome"), object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
            self.dismiss(animated: true,completion: nil)
        })
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
