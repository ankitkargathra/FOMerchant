//
//  sideMenuViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class SideMenuViewController: BaseViewController {

    @IBOutlet var menuTableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.bounces = false
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "gotohome"), object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(btnHomePressed(_:)), name:NSNotification.Name(rawValue: "gotohome"),object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "gotonotificationlist"), object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(btnSendNotificationPressed(_:)), name:NSNotification.Name(rawValue: "gotonotificationlist"),object: nil)
    }
    
    @objc func navigateFromSideMenu(identifier:String){
    
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: identifier)
        SJSwiftSideMenuController.hideLeftMenu()
        SJSwiftSideMenuController.pushViewController(vc, animated: false)
    }
    
    
    
    // Mark: - IB Actions
    @IBAction func btnSendNotificationPressed(_ sender: UIButton) {
        
        navigateFromSideMenu(identifier: EPConstant.ViewControllerIdentifiers.kNotificationListViewController)
    
    }

    @IBAction func btnAccountSettingPressed(_ sender: EPAccountSettingButton) {
    
        navigateFromSideMenu(identifier: EPConstant.ViewControllerIdentifiers.kAccountSettingsViewController)
    
    }
    
    @IBAction func btnPastOrderPressed(_ sender: UIButton) {
    
        navigateFromSideMenu(identifier: EPConstant.ViewControllerIdentifiers.kMainViewController)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "btnPastTapped"), object: nil)
        }
        
        
    }
    @IBAction func btnHomePressed(_ sender: UIButton) {
    
        navigateFromSideMenu(identifier: EPConstant.ViewControllerIdentifiers.kMainViewController)
    
    }
    
    @IBAction func othersFromSidemenuBtnPressed(_ sender: UIButton) {
        
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kOtherFromSideMenuViewController) as! OtherFromSideMenuViewController
        SJSwiftSideMenuController.hideLeftMenu()
        if let buttonTitle = sender.title(for: .normal) {
         vc.strHeader = buttonTitle
        }
        SJSwiftSideMenuController.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnLogoutPressed(_ sender: UIButton) {
        
        showAlertButtons(message : "Are you sure you want to logout?")
    
    }
    
   override func btnYesTapped() {
    
        UserDefaults.standard.set(nil, forKey: "userData")
        UserDefaults.standard.synchronize()
        AppDel.checkUserStatus()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell\(indexPath.row+1)"
        
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
        }

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.row == 0 {
//
//           // let vc = EPConstant.Storyboard.AuthenticationStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kIntroViewController) as! ViewController
//        }
//        let destVC = UIViewController()
//        SJSwiftSideMenuController.hideLeftMenu()
//        SJSwiftSideMenuController.pushViewController(destVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 125
        }else if indexPath.row == 1{
            return 133
        }else if indexPath.row == 2{
            return 190
        }else if indexPath.row == 3{
            return 243
        }
        return 0
    }
}
