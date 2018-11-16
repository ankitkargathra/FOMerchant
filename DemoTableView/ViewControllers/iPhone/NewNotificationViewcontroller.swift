//
//  NewNotificationViewcontroller.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class NewNotificationViewcontroller: BaseViewController {

    var delegete:NotificationListViewController?
    
    @IBOutlet weak var btnSelectVoucer: UIButton!
    @IBOutlet weak var btnSelectUser: UIButton!
    
    override func viewDidLoad() {
    setUpSideMenu(isShow: false)
    SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
    loadHeaderViewBackButton(title: "Send a new notification")
    self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    }

    override func menuTapped(){
        if let dele = delegete {
            dele.viewDidLoad()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func getData(strValue:String = "", strType:String = ""){
        if strType == "1"{
         btnSelectUser.setTitle(strValue, for: .normal)
        }else{
         btnSelectVoucer.setTitle(strValue, for: .normal)
        }
    }
    
    func navigateFromSendNotification(type:String){
        if type == "3"{
            let vc = EPConstant.Storyboard.CardDetail.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kCardDetailViewController) as! CardDetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kSendNewNotificationDetailViewController) as! SendNewNotificationDetailViewController
            vc.strType = type
            vc.delegete = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func btnSelectUserPressed(_ sender: UIButton) {
        navigateFromSendNotification(type: "1")
    }
    
    @IBAction func btnSelectVoucherPressed(_ sender: UIButton) {
        navigateFromSendNotification(type: "2")
    }
    
    @IBAction func btnPayAndSendPressed(_ sender: EPButtonGreenButton) {
    
        navigateFromSendNotification(type: "3")
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
