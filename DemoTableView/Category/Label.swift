//
//  label.swift
//  DemoTableView
//
//  Created by Rajat Lala on 11/08/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

class EPLabelTitle: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:23.0))
        self.textAlignment = .center
        self.textColor = UIColor.black
        self.numberOfLines = 1;
    }
}
class EPLabelDescription: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:15.3))
        self.textAlignment = .center
        self.textColor = EPConstant.Colors.GREY_COLOR_THEME
        self.numberOfLines = 0
    }
}

class EPLabelWelComeTitle: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:20.2))
        self.textAlignment = .center
        self.textColor = UIColor.black
        self.numberOfLines = 1;
    }
}

class EPLabelForgotPasswordDesc: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:13.2))
        self.textColor = EPConstant.Colors.TEXT_GREY_THEME
        self.numberOfLines = 0
    }
}

class EPLabelNameSideMenu: EPLabelTitle {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Demi, size: getProportionalFont(size:18.8))
        self.textAlignment = .left
    }
}
class EPNotificationSuccess: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:15.3))
        self.textAlignment = .center
        self.textColor = EPConstant.Colors.BLACK_COLOR_THEME
        self.numberOfLines = 0
    }
}
