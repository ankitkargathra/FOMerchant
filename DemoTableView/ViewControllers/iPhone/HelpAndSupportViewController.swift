//
//  HelpAndSupportVC.swift
//  FoodOrder
//
//  Created by Rohan on 09/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class HelpAndSupportViewController: BaseViewController {

    @IBOutlet weak var txtTopic: RaisePlaceholder!
    @IBOutlet weak var txtDetails: UITextView!
    var strHeader:String!
    var textViewPlaceholderAddress = "Message"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideMenu(isShow: true,title: strHeader)
        txtTopic.validateTextField(type: .Normal, minLength: 6, maxLength: 50, alignment: NSTextAlignment.left, placeHolder: "Choose Topic")
        txtDetails.delegate = self
        txtDetails.text = textViewPlaceholderAddress
        txtDetails.textColor = EPConstant.Colors.TEXT_VIEW_GREY_THEME
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSendPress(_ sender: Any) {
        
        self.view.endEditing(true)
        if txtTopic.text?.trim().count ?? 0 > 0 {
            if txtDetails.text.trim().count > 0 && txtDetails.text.trim() != textViewPlaceholderAddress{
                GenericClass.sharedInstance.CallHelpSupportApi(topic: txtTopic.text!, message: txtDetails.text!) { (isSuccess, message, dictionary) in
                    if isSuccess{
                        if let responseDict = dictionary{
                            self.showToast(msg: responseDict["message"] as! String)
                        }
                    }
                }
            } else {
                self.showToast(msg: DEFAULT_NO_MESSAGE)
            }
        }else{
            self.showToast(msg: DEFAULT_NO_TOPIC)
        }
    }
}
extension HelpAndSupportViewController:UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView){
        if textView == txtDetails{
            if textView.text.trim() == textViewPlaceholderAddress{
                textView.text = ""
                textView.textColor = .black
            }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView){
        if textView == txtDetails{
            if textView.text.trim() == ""{
                textView.text = textViewPlaceholderAddress
                textView.textColor = EPConstant.Colors.TEXT_VIEW_GREY_THEME
            }
        }
    }
}
