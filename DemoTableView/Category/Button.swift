//
//  button.swift
//  DemoTableView
//
//  Created by Rajat Lala on 11/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

class EPButton: UIButton{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}

class EPButtonGreenButton: EPButton{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    self.titleLabel?.font = Devices.isIphone ? Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:20.3)) : Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:30.0))
    }
}

class EPSignInButton: EPButton{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MakeSignInButton()
    }
    
    func MakeSignInButton(){
        //Initialize a button
        self.backgroundColor = EPConstant.Colors.GREEN_COLOR_THEME
        self.titleLabel?.font = Devices.isIphone ? Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:20.2)) : Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:30.0))
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle("Sign in", for: .normal)
    }
}

class EPForgotButton: UIButton{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Devices.isIphone ? Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:16.7)) : Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:22.7))
    }
}

class EPForgotPasswordButton: EPSignInButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MakeForgotPasswordButton()
    }
    
    func MakeForgotPasswordButton(){
        //Initialize a button
        self.setTitle("Send", for: .normal)
    }
}

class EPAccountSettingButton: EPButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MakeAccountSettingButton()
    }
    
    func MakeAccountSettingButton(){
        //Initialize a button
        self.titleLabel?.font = Devices.isIphone ? Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:13.2)) : Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:20.0))
        self.setTitleColor(EPConstant.Colors.GREY_COLOR_THEME, for: .normal)
        self.setTitle("Account Settings", for: .normal)
        self.borderWidth = 1.0
        self.layer.borderColor = EPConstant.Colors.GREY_COLOR_THEME.cgColor
    }
}

