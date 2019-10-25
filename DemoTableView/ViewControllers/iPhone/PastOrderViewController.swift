//
//  PastOrderViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 06/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class PastOrderViewController: BaseViewController {
    
    @IBOutlet weak var tblViewPastOrder: UITableView!
    @IBOutlet weak var cnsTopView: NSLayoutConstraint!
    
    var pastlistObj = RequestListRootClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopView.constant = 50.0
            }
        }
        tblViewPastOrder.dataSource = self
        tblViewPastOrder.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPastListing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDetailsPressed(_ sender: UIButton) {
        
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kDetailsOrderViewController) as! DetailsOrderViewController
        vc.orderId = self.pastlistObj.data[sender.tag].id
        SJSwiftSideMenuController.pushViewController(vc, animated: true)
    }
}

extension PastOrderViewController{
    func getPastListing(){
        GenericClass.sharedInstance.CallGetOrderApi(restaurentId: kCurrentUser.id, orderStatus:"past", completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    self.pastlistObj.ParseDict(fromDictionary: responseDict["data"] as! [[String : Any]])
                    if self.pastlistObj.data.count > 0{
                        DispatchQueue.main.async {
                            self.tblViewPastOrder.reloadData()
                        }
                    }
                    self.tblViewPastOrder.isHidden = self.pastlistObj.data.count > 0 ? false : true
                }
            }
        })
    }
}

extension PastOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pastlistObj.data != nil ? self.pastlistObj.data.count:0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : PastListingCell! = tblViewPastOrder.dequeueReusableCell(withIdentifier: idstr, for: indexPath) as? PastListingCell
        if cell == nil {
            cell = PastListingCell(style: .default, reuseIdentifier: idstr)
        }
        cell.btnOrderList.tag = indexPath.row
        let data = self.pastlistObj.data[indexPath.row]
        cell.lblOrderNo.text = data.orderNumber
        cell.lblOrderDate.text = GenericClass.getFormattedDateTime(secondss: Double(data.createdAt),isPastListing: true)
        cell.lblOrderFullName.text = data.fullname
        cell.lblOrderStatus.text = data.orderStatus
        cell.lblOrderStatus.textColor = data.orderStatus.trim() == "Order Delivered" ? EPConstant.Colors.GREEN_COLOR_THEME : EPConstant.Colors.ORANGE_COLOR_THEME
        cell.lblOrderCount.text = String(data.orderList.count)+" items"
        cell.lblOrderAmount.text = "$ "+data.grandTotal
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 123
        
    }
}

