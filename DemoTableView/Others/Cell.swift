//
//  Cell.swift
//  DemoTableView
//
//  Created by Rajat Lala on 13/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit


class IntroCollectionCell: UICollectionViewCell{
    @IBOutlet var imgView : UIImageView!
    @IBOutlet var lblTitle : EPLabelTitle!
    @IBOutlet var lblDescription : EPLabelDescription!
    @IBOutlet weak var btnSignIn: EPSignInButton!
    @IBOutlet weak var cnsImageTop: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                self.cnsImageTop.constant = 124
            }
        }
        
    }
}

class TabCell : UICollectionViewCell{
}

class AccountSettingImageCell: UICollectionViewCell{
   
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet var btnAddImg : SLButtonImagePicker!
    @IBOutlet var btnRemoveImg : UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
}

class sideMenuCell: UITableViewCell{
    
    @IBOutlet var imgViewProfile : EPImageView!
    @IBOutlet weak var name: EPLabelNameSideMenu!
    @IBOutlet weak var RestaurantStatus: UISwitch!
    @IBOutlet weak var selfService: UISwitch!
    
}
