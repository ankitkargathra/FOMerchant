//
//  PendingOrderViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 06/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class PendingOrderViewController: BaseViewController {
    
    @IBOutlet weak var tblViewPendingOrder: UITableView!
    @IBOutlet weak var cnsTopView: NSLayoutConstraint!
    @IBOutlet weak var lblHeaderCount: UILabel!
    @IBOutlet weak var cnsHeightHeader: NSLayoutConstraint!
    
    
    var pendinglistObj = RequestListRootClass()
    var pendingOrderDelegate : MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cnsTopView
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopView.constant = 40.0
            }
        }
     tblViewPendingOrder.dataSource = self
     tblViewPendingOrder.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPendingListing()
    }

    @IBAction func btnViewdetailsPressed(_ sender: UIButton) {
   
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kDetailsOrderViewController) as! DetailsOrderViewController
        vc.orderId = self.pendinglistObj.data[sender.tag].id
        SJSwiftSideMenuController.pushViewController(vc, animated: true)
    
    }
    @IBAction func btnMarkOrderStatusPressed(_ sender: EPButtonGreenButton) {
   
        if sender.titleLabel?.text == "Mark Order as Ready"{
            GetOrderStatusUpdate(orderId: self.pendinglistObj.data[sender.tag].id, status: "Order Ready to Serve", btnTag: sender.tag, userId: self.pendinglistObj.data[sender.tag].toUserId)
        }else{
         GetOrderStatusUpdate(orderId: self.pendinglistObj.data[sender.tag].id, status: "Order Delivered", btnTag: sender.tag, userId: self.pendinglistObj.data[sender.tag].toUserId)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PendingOrderViewController{
    func getPendingListing(){
        GenericClass.sharedInstance.CallGetOrderApi(restaurentId: kCurrentUser.id, orderStatus:"pending", completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    self.pendinglistObj.ParseDict(fromDictionary: responseDict["data"] as! [[String : Any]])
                    self.reloadData()
                }
            }
        })
    }
    func GetOrderStatusUpdate(orderId:String, status:String, btnTag:Int,userId:String){
        GenericClass.sharedInstance.CallGetOrderStatusUpdateApi(userId: userId, orderId: orderId, status: status, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    self.getPendingListing()
                }
            }
        })
    }
    
    func reloadData(){
        self.lblHeaderCount.text = "You’ve \(self.pendinglistObj.data.count) new orders received."
        self.lblHeaderCount.isHidden = self.pendinglistObj.data.count > 0 ? false : true
        if self.pendinglistObj.data.count > 0{
            if let dele = self.pendingOrderDelegate{
                dele.tabView.lblPendingListCount.text = "\(self.pendinglistObj.data.count)"
                dele.tabView.lblPendingListCount.isHidden = self.pendinglistObj.data.count > 0 ? false:true
            }
            self.tblViewPendingOrder.reloadData()
        }else{
            cnsHeightHeader.constant = 0
        }
        self.tblViewPendingOrder.isHidden = self.pendinglistObj.data.count > 0 ? false : true

    }
}


extension PendingOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pendinglistObj.data != nil ? self.pendinglistObj.data.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : PendingListingCell! = tblViewPendingOrder.dequeueReusableCell(withIdentifier: idstr) as? PendingListingCell
        if cell == nil {
            cell = PendingListingCell(style: .default, reuseIdentifier: idstr)
        }
        cell.btnOrderList.tag = indexPath.row
        let data = self.pendinglistObj.data[indexPath.row]
        cell.lblOrderNo.text = data.orderNumber
        cell.lblOrderStatus.text = "- "+data.orderStatus
        cell.lblOrderStatus.textColor = data.orderStatus.trim() == "Order In Kitchen" ?  EPConstant.Colors.ORANGE_COLOR_THEME : EPConstant.Colors.GREEN_COLOR_THEME
        cell.lblTableNo.text = "Table #"+data.tableNumber
        cell.lblOrderCount.text = String(data.orderList.count)+" items for "+data.fullname
        cell.lblOrderQueeue.text = data.orderQueue
        cell.btnMarkOrder.backgroundColor = data.orderStatus.trim() == "Order In Kitchen" ? EPConstant.Colors.ORANGE_COLOR_THEME : EPConstant.Colors.GREEN_COLOR_THEME
        cell.btnMarkOrder.setTitle(data.orderStatus.trim() == "Order In Kitchen" ? "Mark Order as Ready" : "Mark Order as Delivered" , for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 193
        
    }
}
