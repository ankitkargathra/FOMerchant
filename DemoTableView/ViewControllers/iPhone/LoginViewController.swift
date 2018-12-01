//
//  LoginViewController.swift
//  DemoTableView
//
//  Created by Admin on 18/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class LoginViewController: BaseViewController {
    
    @IBOutlet var txtEmail : RaisePlaceholder!
    @IBOutlet var txtPassword : RaisePlaceholder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.validateTextField(type: .Email, minLength: 10, maxLength: 50, alignment: NSTextAlignment.left, placeHolder: "Email")
        txtPassword.validateTextField(type: .Password, minLength: 6, maxLength: 50, alignment: NSTextAlignment.left, placeHolder: "Password")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnFogotPasswordPressed(_ sender: UIButton) {
        
        let vc = EPConstant.Storyboard.AuthenticationStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kforgotViewController)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnSignInPressed(_ sender: EPSignInButton) {
        
        if txtEmail.validateTextFiled(validationMesage: .invalidEmail) {
            if txtPassword.validateTextFiled(validationMesage: .invalidPassLength) {
                GenericClass.sharedInstance.CallSignInApi(email: txtEmail.text!, password: txtPassword.text!, userType: "business") { (isSuccess, message, dictionary) in
                    if isSuccess{
                        if let responseDict = dictionary{
                            let arr = responseDict["data"] as! NSArray
                            let dict = arr[0] as! JSONDICTIONARY
                            UserRootClass.shared.parseDict(fromDictionary: dict)
                            UserRootClass.shared.saveToDefaults()
                            AppDel.checkUserStatus()
                            if responseDict["message"] != nil {
                                self.showToast(msg: "Signed In as \(String(describing: UserRootClass.shared.restaurantName!))")
                            }
                        }
                    }
                }
            }
        }
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
