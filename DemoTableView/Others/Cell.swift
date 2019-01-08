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

class RequestListingCell: UITableViewCell{
    
   @IBOutlet var lblOrderNo : UILabel!
   @IBOutlet var lblfullname : UILabel!
   @IBOutlet var lblTime : UILabel!
   @IBOutlet var lblPaymentMethods : UILabel!
   @IBOutlet var lblItemName : UILabel!
   @IBOutlet var lblOrderPrice : UILabel!
   @IBOutlet var lblAddOns : UILabel!
   @IBOutlet var lblTableNo : UILabel!
   @IBOutlet var lblSubTotal : UILabel!
   @IBOutlet var lblSpecialInstruction : UILabel!
   @IBOutlet var btnReject : UIButton!
   @IBOutlet var btnAccept : UIButton!
   @IBOutlet weak var lblAddOnHeader: UILabel!
    
    @IBOutlet weak var cnsLblAddOnTop: NSLayoutConstraint!
    @IBOutlet weak var cnsHeightSpecialInstruction: NSLayoutConstraint!
    @IBOutlet weak var cnsHeightTopSpecialInstruction: NSLayoutConstraint!
}

class PendingListingCell: UITableViewCell{
    
   @IBOutlet var lblOrderNo : UILabel!
   @IBOutlet var lblOrderStatus : UILabel!
   @IBOutlet var lblTableNo : UILabel!
   @IBOutlet var lblOrderCount : UILabel!
   @IBOutlet var lblOrderQueeue : UILabel!
   @IBOutlet weak var btnMarkOrder: EPButtonGreenButton!
    @IBOutlet weak var btnOrderList: UIButton!
    
}

class PastListingCell: UITableViewCell {
    
    @IBOutlet var lblOrderNo : UILabel!
    @IBOutlet var lblOrderDate : UILabel!
    @IBOutlet var lblOrderFullName : UILabel!
    @IBOutlet var lblOrderStatus : UILabel!
    @IBOutlet var lblOrderCount : UILabel!
    @IBOutlet var lblOrderAmount : UILabel!
    @IBOutlet weak var btnOrderList: UIButton!
    
    
}
class OrderDetailsCell: UITableViewCell{
    
    @IBOutlet weak var lblOrderItems: UILabel!
    @IBOutlet weak var lblAddOnHeader: UILabel!
    @IBOutlet weak var lblAddOnItems: UILabel!
    @IBOutlet weak var lblEachItemPrice: UILabel!
    @IBOutlet weak var lblItemsTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblSpecialInstruction: UILabel!
    @IBOutlet weak var lblTableNo: UILabel!
    
    @IBOutlet weak var cnsLblAddOnTop: NSLayoutConstraint!
    @IBOutlet weak var viewSpecialInstruction: UIView!
    
}

class NotificationListCell:UITableViewCell{
    
    @IBOutlet weak var lblDiscountAmount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnUserType: UIButton!
    @IBOutlet weak var lblValidDate: UILabel!
}
