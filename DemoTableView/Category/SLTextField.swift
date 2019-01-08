//
//  SLTextField.swift
//  Truper
//
//  Created by Rohan on 07/08/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

 public class TextField: UITextField, UITextFieldDelegate {
    
    // TestField Types
    enum TextFieldType {
        case Normal
        case Email
        case Password
        case Mobile
        case BDate
    }
    
    // TestField Validation messages
    enum ValidationMessage: String  {
        case emptyEmail = "Please enter email"
        case invalidEmail = "Please enter valid email"
        case emptypassword = "Please enter password"
        case invalidPassLength = "Please enter password with minimum"
        case invalidConfirmPass = "Password and Confirm password not matched"
        case emptyMobile = "Please enter mobile number"
        case invalidMobile = "Please enter valid mobile number"
        case invalideMinBDate = "Age required min 10"
        case emptyName = "Please enter name"
        case emptyGender = "Please select gender"
        case emptyCardHolderName = "Please enter Card holder name"
        case emptyfirstName = "Please enter first name"
        case emptylastName = "Please enter last name"
        case blank = ""
    }
    
    var textMaxLength: Int! = 0
    var textMinLength: Int! = 0
    
    var validationStrMessage: String = ""
    var textType: TextFieldType!
    
    var datePicker: UIDatePicker {
        let dtPicker = UIDatePicker()
        dtPicker.datePickerMode = .date
        return dtPicker
    }
    var datePickerFormate: String! = "dd/MM/yyyy"
    
    func validateTextField(type: TextFieldType, minLength: Int, maxLength: Int, alignment: NSTextAlignment, placeHolder: String = "") {
        
        textType = type
        textMaxLength = maxLength
        textMinLength = minLength
        self.placeholder = placeHolder
        self.delegate = self
        self.textAlignment = alignment
        switch textType! {
            
        case .Normal:
            self.keyboardType = .default
            break
        case .Email:
            self.keyboardType = .emailAddress
            break
        case .Password:
            self.isSecureTextEntry = true
            break
        case .Mobile:
            self.keyboardType = .numberPad
            break
        case .BDate:
            self.inputView = datePicker
            datePicker.addTarget(self, action: #selector(self.setDateToTextField), for: .valueChanged)
            break
        }
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        
        switch textType! {
        case .Normal:
            return newLength <= textMaxLength
        case .Email:
            return newLength <= textMaxLength
        case .Password:
            return newLength <= textMaxLength
        case .Mobile:
            return newLength <= textMaxLength
        case .BDate:
            return true
        }
    }
    
   public  func textFieldDidEndEditing(_ textField: UITextField) {
        let textValue = textField.text!
        switch textType! {
            
        case .Normal:
            
            break
        case .Email:
            if !self.isValidEmail(testStr: textValue) {
            }
            break
        case .Password:
            if textValue.count < textMinLength {
            }
            break
        case .Mobile:
            if textValue.count < textMinLength {
            }
            break
        case .BDate:
            self.setDateToTextField()
            return
        }
    }
    
    func validateTextFiled(validationMesage: ValidationMessage?,customMessage : String = "") -> Bool {
        let textValue = self.text!
        switch textType! {
            
        case .Normal:
            if textValue.trim().count == 0 {
                validationStrMessage = customMessage
                showToast(msg: validationStrMessage)
                return false
            }else{
                return true
            }
        case .Email:
            
            if textValue.trim().count == 0 {
                validationStrMessage = ValidationMessage.emptyEmail.rawValue
                showToast(msg: validationStrMessage)
                return false
            }
            
            if !self.isValidEmail(testStr: textValue) {
                validationStrMessage = validationMesage!.rawValue
                showToast(msg: validationStrMessage)
                return false
            } else {
                return true
            }
        case .Password:
            
            if textValue.trim().count == 0 {
                validationStrMessage = ValidationMessage.emptypassword.rawValue
                showToast(msg: validationStrMessage)
                return false
            }
            
            if textValue.count < textMinLength {
                validationStrMessage = validationMesage!.rawValue + " \(textMinLength!) digits."
                showToast(msg: validationStrMessage)
                return false
            } else {
                return true
            }
        case .Mobile:
            
            if textValue.trim().count == 0 {
                validationStrMessage = ValidationMessage.emptyMobile.rawValue
                showToast(msg: validationStrMessage)
                return false
            }
            if textValue.count < textMinLength {
                validationStrMessage = validationMesage!.rawValue
                showToast(msg: validationStrMessage)
                return false
            } else {
                return true
            }
        case .BDate:
            if textValue.count == 0 {
                validationStrMessage = "please enter B'Date"
                showToast(msg: validationStrMessage)
                return false
            } else {
                
            }
            return true
        }
    }
    
    //MARK: Email Varification
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showToast(msg : String){
        
        let view = UIView(frame: CGRect(x: 0, y: AppDel.window!.frame.height, width: AppDel.window!.frame.width, height: 0))
        let lblText = UILabel(frame: CGRect(x: 20, y: 10, width: AppDel.window!.frame.width - 40, height: 20.0))
        lblText.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:16.0))
        lblText.textAlignment = .left
        lblText.numberOfLines = 0
        view.backgroundColor = UIColor.clear
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear, .curveEaseInOut], animations:{
            
            view.frame = CGRect(x: 0, y: AppDel.window!.frame.height - 40, width: AppDel.window!.frame.width, height: 40)
            lblText.textColor = UIColor.white
            view.backgroundColor = UIColor.black
            view.alpha = 0.9
            lblText.text = msg
            view.addSubview(lblText)
            AppDel.window?.addSubview(view)
            self.perform(#selector(self.hideToast(view:)), with: view, afterDelay: 2.0)
            
        },completion: nil)
    }
    
    @objc func hideToast(view:UIView){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear, .curveEaseInOut], animations:{
            view.backgroundColor = UIColor.clear
            view.frame = CGRect(x: 0, y: AppDel.window!.frame.height, width: view.frame.width, height: 40)
        })
    }
    
    //MARK: Set date from datePicker
    
    @objc func setDateToTextField() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = datePickerFormate
        self.text = dateFormatter.string(from: datePicker.date)
    }
    
}
