//
//  NotificationListViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit

class NotificationListViewController: BaseViewController {
    
    @IBOutlet weak var tblViewNotiList: UITableView!
    @IBOutlet weak var viewSentNotifiHeader: UIView!
    
    var notificationListObj = NotificationListRootClass()
    var attrs = [
        NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13.0),
        NSAttributedStringKey.foregroundColor : UIColor.black,
        NSAttributedStringKey.underlineStyle : 1] as [NSAttributedStringKey : Any]
    
    override func viewDidLoad(){
        setUpSideMenu(isShow: true,title:"Send Notifications")
        super.viewDidLoad()
        GetNotificationList()
        self.tblViewNotiList.rowHeight = 400.0
        self.tblViewNotiList.estimatedRowHeight = 400.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSendNewNotiPressed(_ sender: EPButton){
        
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kNewNotificationViewcontroller) as! NewNotificationViewcontroller
        vc.delegete = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NotificationListViewController{
    func GetNotificationList(){
        GenericClass.sharedInstance.CallGetRestaurentNotificationListApi(restaurentId: kCurrentUser.id!){ (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    if (responseDict.count == 0){
                        self.tblViewNotiList.isHidden = true
                        self.viewSentNotifiHeader.isHidden = true
                    }else{
                        self.notificationListObj.ParseDict(fromDictionary: responseDict["data"] as! [JSONDICTIONARY])
                        DispatchQueue.main.async {
                            self.tblViewNotiList.reloadData()
                        }
                    }
                }
            }else{
                self.tblViewNotiList.isHidden = true
                self.viewSentNotifiHeader.isHidden = true

            }
        }
    }
}

extension NotificationListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationListObj.data != nil ? self.notificationListObj.data.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : NotificationListCell! = tblViewNotiList.dequeueReusableCell(withIdentifier: idstr) as? NotificationListCell
        if cell == nil {
            cell = NotificationListCell(style: .default, reuseIdentifier: idstr)
        }
        let data = self.notificationListObj.data[indexPath.row]
        cell.lblDiscountAmount.text = data.voucherName
        cell.lblDescription.text = data.notification
        cell.lblDate.text = "Sent on \(GenericClass.getFormattedDateTime(secondss: Double(data.createdAt)!, NotificationHeader:true))"
        cell.lblValidDate.text = "- Offer valid till \(GenericClass.getFormattedDateTime(secondss: Double(data.endDate)!, NotificationOffer:true))"
        let buttonTitleStr = NSMutableAttributedString(string:"sent to \(data.userSent!)(\(data.sentTo!))", attributes:attrs)
        let attributedString = NSMutableAttributedString(string:"")
        attributedString.append(buttonTitleStr)
        cell.btnUserType.setAttributedTitle(attributedString, for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
}
