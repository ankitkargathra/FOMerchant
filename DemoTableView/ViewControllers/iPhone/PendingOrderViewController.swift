//
//  PendingOrderViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 06/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class PendingOrderViewController: BaseViewController {
    
    @IBOutlet weak var tblViewPendingOrder: UITableView!
    @IBOutlet weak var cnsTopView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cnsTopView
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopView.constant = 40.0
            }
        }
     tblViewPendingOrder.dataSource = self
     tblViewPendingOrder.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func btnViewdetailsPressed(_ sender: UIButton) {
   
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kDetailsOrderViewController) as! DetailsOrderViewController
        SJSwiftSideMenuController.pushViewController(vc, animated: true)
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PendingOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : UITableViewCell! = tblViewPendingOrder.dequeueReusableCell(withIdentifier: idstr)!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 193
        
    }
}
