//
//  RequestOrderViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 06/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import LoadingPlaceholderView

class RequestOrderViewController: BaseViewController {
    
    @IBOutlet weak var tblViewRequestOrder: UITableView!
    @IBOutlet weak var cnsTopNewOrder: NSLayoutConstraint!
    @IBOutlet weak var lblHeaderCount: UILabel!
    @IBOutlet weak var cnsheightHeader: NSLayoutConstraint!
    
    
    var requestlistObj = RequestListRootClass()
    var btnTagReject:Int!
    var RequestOrderDelegate : MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopNewOrder.constant = 40.0
            }
        }
        tblViewRequestOrder.estimatedRowHeight = 400.0
        tblViewRequestOrder.estimatedSectionFooterHeight = 400.0
        tblViewRequestOrder.tableFooterView = UIView()
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "getRequestListing"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getRequestListing), name: NSNotification.Name(rawValue: "getRequestListing"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRequestListing()
    }
    
    @IBAction func btnAcceptPressed(_ sender: UIButton) {
    
        GetOrderStatusUpdate(orderId: self.requestlistObj.data[sender.tag].id, status: "Order In Kitchen", btnTag: sender.tag, userId: self.requestlistObj.data[sender.tag].toUserId)
        
    }
    
    @IBAction func btnRejectPressed(_ sender: UIButton) {
    
     btnTagReject = sender.tag
     showAlertButtons(message : "Are you sure you want to reject this order?")
        
    }

    override func btnYesTapped() {
        
        self.hideAlertButtons()
        GetOrderStatusUpdate(orderId: self.requestlistObj.data[btnTagReject].id, status: "Order Rejected", btnTag: btnTagReject, userId: self.requestlistObj.data[btnTagReject].toUserId)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RequestOrderViewController{
    
    @objc func getRequestListing(){
        GenericClass.sharedInstance.CallGetOrderApi(restaurentId: kCurrentUser.id, orderStatus:"req", completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    if self.requestlistObj.data != nil{
                        self.requestlistObj.data.removeAll()
                    }
                    self.requestlistObj.ParseDict(fromDictionary: responseDict["data"] as! [[String : Any]])
                    self.reloadData()
                }
            }
        })
    }
    func GetOrderStatusUpdate(orderId:String, status:String, btnTag:Int, userId:String){
        GenericClass.sharedInstance.CallGetOrderStatusUpdateApi(userId: userId, orderId: orderId, status: status, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                self.requestlistObj.data.remove(at: btnTag)
                self.reloadData()
            }
        })
    }
    func reloadData(){
        self.lblHeaderCount.text = "You’ve \(self.requestlistObj.data.count) new orders received."
        self.lblHeaderCount.isHidden = self.requestlistObj.data.count > 0 ? false : true
        if self.requestlistObj.data.count > 0{
            if let dele = self.RequestOrderDelegate{
                dele.tabView.lblRequestListCount.text = "\(self.requestlistObj.data.count)"
                dele.tabView.lblRequestListCount.isHidden = self.requestlistObj.data.count > 0 ? false:true
            }
            DispatchQueue.main.async {
                self.tblViewRequestOrder.reloadData()
            }
        }else{
            if let dele = self.RequestOrderDelegate{
                dele.tabView.lblRequestListCount.isHidden = self.requestlistObj.data.count > 0 ? false:true
            }
            cnsheightHeader.constant = 0
        }
        self.tblViewRequestOrder.isHidden = self.requestlistObj.data.count > 0 ? false : true
    }
}

extension RequestOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.requestlistObj.data != nil ? self.requestlistObj.data.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requestlistObj.data[section].orderList != nil ? self.requestlistObj.data[section].orderList.count:0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let idstr = "cellHeader"
        var cell : RequestListingCell! = tblViewRequestOrder.dequeueReusableCell(withIdentifier: idstr) as? RequestListingCell
        if cell == nil {
            cell = RequestListingCell(style: .default, reuseIdentifier: idstr)
        }
        let data = self.requestlistObj.data[section]
        cell.lblOrderNo.text = data.orderNumber
        cell.lblfullname.text = "by "+data.fullname
        cell.lblTime.text = GenericClass.getFormattedDateTime(secondss: Double(data.createdAt))
        cell.lblPaymentMethods.text = data.paymentMethods
        cell.selectionStyle = .none
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let idstr = "cellFoodInstruction"
        var cell : RequestListingCell! = tblViewRequestOrder.dequeueReusableCell(withIdentifier: idstr) as? RequestListingCell
        if cell == nil {
            cell = RequestListingCell(style: .default, reuseIdentifier: idstr)
        }
        
        let data = self.requestlistObj.data[section]
        cell.btnAccept.tag = section
        cell.btnReject.tag = section
        cell.lblTableNo.text = data.tableNumber
        cell.lblSubTotal.text = "$"+data.grandTotal
        cell.lblSpecialInstruction.text = data.specialCookingInstructions  !=  nil ? data.specialCookingInstructions : ""
        guard data.specialCookingInstructions  !=  nil else{
            cell.cnsHeightSpecialInstruction.constant = 0
            cell.cnsHeightTopSpecialInstruction.constant = 0
            return cell
        }
        cell.selectionStyle = .none
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : RequestListingCell! = tblViewRequestOrder.dequeueReusableCell(withIdentifier: idstr, for: indexPath) as? RequestListingCell
        if cell == nil {
            cell = RequestListingCell(style: .default, reuseIdentifier: idstr)
        }
        cell.selectionStyle = .none
        cell.updateConstraintsIfNeeded()
        cell.updateConstraintsIfNeeded()
        let data = self.requestlistObj.data[indexPath.section].orderList[indexPath.row]
        let customValue = data.customizationValue != nil ? "("+"\(String(describing: data.customizationValue ?? ""))"+")" : ""
        cell.lblItemName.text = data.quantity+"x "+data.itemName+customValue
        cell.lblOrderPrice.text = "$"+"\(Int(Double(data.itemPrice)!)*Int(Double(data.quantity)!))"
        guard let str = data.addOnName as? String else {
            cell.lblAddOns.isHidden = true
            cell.lblAddOnHeader.isHidden = true
            cell.cnsLblAddOnTop.constant = -25
            return cell
        }
        cell.lblAddOns.text = "- "+str
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
