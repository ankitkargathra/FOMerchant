//
//  ChangePasswordVC.swift
//  FoodOrder
//
//  Created by Rohan on 19/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class ChangePasswordViewController: BaseViewController {

    var delegete:AccountSettingsViewController?
    
    @IBOutlet weak var txtOldPassword: RaisePlaceholder!
    @IBOutlet weak var txtNewPassword: RaisePlaceholder!
    @IBOutlet weak var txtNewConfirmPass: RaisePlaceholder!
    
    override func viewDidLoad() {
        setUpSideMenu(isShow: false)
        SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
        loadHeaderViewBackButton(title: "Change Password")
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
        super.viewDidLoad()
        
        txtOldPassword.isSecureTextEntry = true
        txtNewPassword.isSecureTextEntry = true
        txtNewConfirmPass.isSecureTextEntry = true
        
        txtOldPassword.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"Old Password")
        txtNewPassword.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"New Password")
        txtNewConfirmPass.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"Repeat New Password")

        // Do any additional setup after loading the view.
    }
    
    func PopTo(){
        if let dele = delegete {
            dele.viewDidLoad()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    override func menuTapped(){
        self.PopTo()
    }
    
    
    @IBAction func btnupdatePassPress(_ sender: Any) {
        self.view.endEditing(true)
        if txtOldPassword.validateTextFiled(validationMesage: .invalidPassLength) {
            if txtNewPassword.validateTextFiled(validationMesage: .invalidPassLength){
                if txtNewConfirmPass.validateTextFiled(validationMesage: .invalidPassLength) {
                    if txtNewPassword.text! == txtNewConfirmPass.text! {
                        ApiController.sharedInstace.ChangePassword(oldPassword: txtOldPassword.text!, newPassword: txtNewPassword.text!) { (success, message, response) in
                            if success {
                                self.PopTo()
                                self.showToast(msg: response!["message"] as! String)
                            }
                        }
                    } else {
                        self.showToast(msg: PASSWORD_MISMATCH)
                    }
                }
            }
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
