//
//  ForgotPasswordViewController.swift
//  DemoTableView
//
//  Created by Admin on 18/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    
    @IBOutlet var txtEmail : RaisePlaceholder!
    @IBOutlet var lblDescrption: EPLabelDescription!
    
    override func viewDidLoad() {
        self.loadHeaderViewBackButton(title: "")
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_green"), for: .normal)
        txtEmail.validateTextField(type: .Email, minLength: 10, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Email")
        lblDescrption.text = EPConstant.FORGOTPASSWORD.DESCRIPTION
        lblDescrption.setLineSpacing(lineSpacing: 2.5, lineHeightMultiple: 1.0)
        lblDescrption.textAlignment = .left
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func menuTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnForgotPasswordPressed(_ sender: EPForgotPasswordButton) {
        
        if txtEmail.validateTextFiled(validationMesage: .invalidEmail) {
            GenericClass.sharedInstance.CallForgotPasswordApi(email: txtEmail.text!) { (isSuccess, message, dictionary) in
                if isSuccess{
                    if let responseDict = dictionary{
                        if responseDict["status"] as! String == "200"{
                            if responseDict["message"] != nil {
                                self.showToast(msg: responseDict["message"] as! String)
                            }
                            self.menuTapped()
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
