//
//  CardDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CardDetailViewController: BaseViewController{

    override func viewDidLoad(){
        setUpSideMenu(isShow: false)
        loadHeaderViewBackButton(title: "Pay for Notification",subTitle: "200 Notification, for $25")
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOrderPress(){
        let notifiSummaryvc = EPConstant.Storyboard.NotificationSummary.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kNotificationSummaryViewController) as! NotificationSummaryViewController
        self.navigationController?.present(notifiSummaryvc, animated: true, completion: nil)
    }
    
    override func menuTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}
