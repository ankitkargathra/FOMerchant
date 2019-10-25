//
//  DetailsOrderViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 06/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class DetailsOrderViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewOrderChangedStatus: UIView!
    @IBOutlet weak var btnChangeOrderStatus: EPButtonGreenButton!
    
    
    var orderId:String!
    var detailOrderListing = RequestListRootClass()
    var pendingOrderDelegate : PendingOrderViewController?
    
    override func viewDidLoad() {
        setUpSideMenu(isShow: false)
        SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
        loadHeaderViewBackButton(title: "Order #",subTitle: "by", Date: "", ImgDropDown: true)
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
        super.viewDidLoad()
        tblView.estimatedRowHeight = 400.0
        tblView.estimatedSectionFooterHeight = 400.0
        tblView.tableFooterView = UIView()
        getDetailOrderListing()
        // Do any additional setup after loading the view.
    }
    
    override func menuTapped(){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnMarkOrderStatusPressed(_ sender: EPButtonGreenButton) {
        
        if sender.titleLabel?.text == "Mark Order as Ready"{
            GetOrderStatusUpdate(orderId: self.detailOrderListing.data[sender.tag].id, status: "Order Ready to Serve", btnTag: sender.tag, userId: self.detailOrderListing.data[sender.tag].toUserId)
        }else{
            GetOrderStatusUpdate(orderId: self.detailOrderListing.data[sender.tag].id, status: "Order Delivered", btnTag: sender.tag, userId: self.detailOrderListing.data[sender.tag].toUserId)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension DetailsOrderViewController{
    func getDetailOrderListing(){
        GenericClass.sharedInstance.CallGetOrderDetailsApi(orderId: orderId, restaurentId:kCurrentUser.id, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    self.detailOrderListing.ParseDict(fromDictionary: responseDict["data"] as! [[String : Any]])
                    self.reloadData()
                }
            }
        })
    }
    func GetOrderStatusUpdate(orderId:String, status:String, btnTag:Int,userId:String){
        GenericClass.sharedInstance.CallGetOrderStatusUpdateApi(userId: userId, orderId: orderId, status: status, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let dele = self.pendingOrderDelegate {
                    dele.getPendingListing()
                    self.navigationController?.popViewController(animated: true)
                }
            }
        })
    }
    
    func reloadData(){
        if self.detailOrderListing.data.count > 0{
            self.headerViewButtons.lblTitle.text = "Order #\(self.detailOrderListing.data[0].orderNumber!)"
            self.headerViewButtons.lblSubTitle.text = "by \(self.detailOrderListing.data[0].fullname!)"
            self.headerViewButtons.lblDate.text = GenericClass.getFormattedDateTime(secondss: Double(self.detailOrderListing.data[0].createdAt!))
            if self.detailOrderListing.data[0].orderStatus == "Order Delivered" || self.detailOrderListing.data[0].orderStatus == "Order Rejected"{
                self.viewOrderChangedStatus.isHidden = true
            }else{
                self.viewOrderChangedStatus.isHidden = false
            }
            self.btnChangeOrderStatus.backgroundColor = self.detailOrderListing.data[0].orderStatus.trim() == "Order In Kitchen" ? EPConstant.Colors.ORANGE_COLOR_THEME : EPConstant.Colors.GREEN_COLOR_THEME
            self.btnChangeOrderStatus.setTitle(self.detailOrderListing.data[0].orderStatus.trim() == "Order In Kitchen" ? "Mark Order as Ready" : "Mark Order as Delivered" , for: .normal)
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
        self.tblView.isHidden = self.detailOrderListing.data.count > 0 ? false : true
    }
}
extension DetailsOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.detailOrderListing.data != nil ? self.detailOrderListing.data.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailOrderListing.data[section].orderList != nil ? self.detailOrderListing.data[section].orderList.count:0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let idstr = "cell"
        var cell : OrderDetailsCell! = tblView.dequeueReusableCell(withIdentifier: idstr, for: indexPath) as? OrderDetailsCell
        if cell == nil {
            cell = OrderDetailsCell(style: .default, reuseIdentifier: idstr)
        }
        cell.selectionStyle = .none
        cell.updateConstraintsIfNeeded()
        cell.updateConstraintsIfNeeded()
        let data = self.detailOrderListing.data[indexPath.section].orderList[indexPath.row]
        cell.lblOrderItems.text = data.quantity+"x "+data.itemName+"("+"\(String(describing: data.customizationValue ?? ""))"+")"
        cell.lblEachItemPrice.text = "$"+"\(Int(Double(data.itemPrice)!)*Int(Double(data.quantity)!))"
        guard let str = data.addOnName as? String else {
            cell.lblAddOnItems.isHidden = true
            cell.lblAddOnHeader.isHidden = true
            cell.cnsLblAddOnTop.constant = -25
            return cell
        }
        cell.lblAddOnItems.text = "- "+str
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let idstr = "cellTotal"
        var cell : OrderDetailsCell! = tblView.dequeueReusableCell(withIdentifier: idstr) as? OrderDetailsCell
        if cell == nil {
            cell = OrderDetailsCell(style: .default, reuseIdentifier: idstr)
        }
        let data = self.detailOrderListing.data[section]
        cell.lblTableNo.text = data.tableNumber
        cell.lblItemsTotal.text = "$"+data.grandTotal
        cell.lblTax.text = "$"+data.tax
        cell.lblSubTotal.text = "$"+data.subTotal
        cell.lblSpecialInstruction.text = data.specialCookingInstructions != nil ? data.specialCookingInstructions : ""
        guard data.specialCookingInstructions != nil else{
            cell.viewSpecialInstruction.isHidden = true
            return cell
        }
        cell.selectionStyle = .none
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
