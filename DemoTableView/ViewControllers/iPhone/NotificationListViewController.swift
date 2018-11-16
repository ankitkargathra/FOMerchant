//
//  NotificationListViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit

class NotificationListViewController: BaseViewController {

    @IBOutlet weak var tblViewNotiList: UITableView!
    
    
    override func viewDidLoad(){
        setUpSideMenu(isShow: true,title:"Send Notifications")
        super.viewDidLoad()
//        tblViewNotiList.dataSource = self
//        tblViewNotiList.delegate = self
        // Do any additional setup after loading the view.
    }

    func setupTopbar(){
//        SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
    }
    
    
    @IBAction func btnSendNewNotiPressed(_ sender: EPButton){

        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kNewNotificationViewcontroller) as! NewNotificationViewcontroller
        vc.delegete = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NotificationListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 190
        
    }
}
