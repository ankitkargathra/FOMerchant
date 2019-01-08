//
//  CustomHeader.swift
//  DemoTableView
//
//  Created by Urja_Macbook on 16/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HeaderViewActionsProtocol
{
    func menuTapped()
    func searchTapped()
}

@objc protocol TabViewViewActionsProtocol
{
    @objc func btnRequestTapped()
    @objc func btnPendingTapped()
    @objc func btnPastTapped()
}

class HeaderViewDefault: UIView{
    
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var btnMenu : UIButton!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    var delegate : HeaderViewActionsProtocol?
    
    //MARK: - Actions -
    @IBAction func btnSearchPressed(_ sender: UIButton){
        if let dele = self.delegate{
            dele.searchTapped()
        }
    }
    @IBAction func btnMenuTapped(_ sender: Any){
        if let dele = self.delegate{
            dele.menuTapped()
        }
    }
}

class HeaderViewBackButton : HeaderViewDefault{
    
    @IBOutlet var lblSubTitle : UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgDropDown: UIImageView!
}

class TabView : UIView{
    @IBOutlet weak var ViewTopTabView: NSLayoutConstraint!
    @IBOutlet weak var underLineCenter: NSLayoutConstraint!
    @IBOutlet var btn0 : UIButton!
    @IBOutlet var btn1 : UIButton!
    @IBOutlet var btn2 : UIButton!
    @IBOutlet var underlineView : UIView!
    @IBOutlet weak var lblRequestListCount: UILabel!
    @IBOutlet weak var lblPendingListCount: UILabel!
    
    var delegate : TabViewViewActionsProtocol?
    
    override func awakeFromNib() {
        
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                ViewTopTabView.constant = 20.0
            }
        }
        
    }
    
    @IBAction func btnAt0Tapped(_ sender: UIButton)
    {
        if let dele = self.delegate{
            dele.btnRequestTapped()
        }
    }
    
    @IBAction func btnAt1Tapped(_ sender: Any)
    {
        if let dele = self.delegate{
            dele.btnPendingTapped()
        }
    }
    
    @IBAction func btnAt2Tapped(_ sender: Any)
    {
        if let dele = self.delegate{
            dele.btnPastTapped()
        }
    }
    
}
