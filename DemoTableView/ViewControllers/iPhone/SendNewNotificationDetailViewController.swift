//
//  SendNewNotificationDetailViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/11/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class SendNewNotificationDetailViewController: BaseViewController {
    
    @IBOutlet weak var tblViewNotificationDetails: UITableView!
    
    var strType:String!
    var arr : [String]!
    var arrVoucer : [String]!
    var delegete:NewNotificationViewcontroller?
    
    override func viewDidLoad() {
        setUpSideMenu(isShow: false)
        SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
        loadHeaderViewBackButton(title: "Send a new notification")
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
        super.viewDidLoad()
        arr = ["Everyone", "User only", "Existing user only"]
        arrVoucer = ["20% OFF", "50% OFF", "10% OFF"]
        tblViewNotificationDetails.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    override func menuTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SendNewNotificationDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : UITableViewCell! = tblViewNotificationDetails.dequeueReusableCell(withIdentifier: idstr)!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
        }
        if strType == "1"{
            cell.textLabel?.text = arr[indexPath.row]
        }else{
            cell.textLabel?.text = arrVoucer[indexPath.row]
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data:String!
        if strType == "1"{
            data = arr[indexPath.row]
        }else{
            data = arrVoucer[indexPath.row]
        }
        if let dele = delegete {
            dele.getData(strValue: data, strType:strType)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 59
        
    }
}
