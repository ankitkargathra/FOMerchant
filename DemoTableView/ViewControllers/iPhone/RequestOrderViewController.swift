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

    override func viewDidLoad() {
        super.viewDidLoad()
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopNewOrder.constant = 40.0
            }
        }
//    cnsTopNewOrder
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension RequestOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let idstr = "cellHeader"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 1 || indexPath.row == 2{
            
            let idstr = "cell"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 3{
            
            let idstr = "cellTotal"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 4{
            
            let idstr = "cellFoodInstruction"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
            
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            
            return 52
            
        }else if indexPath.row == 1 ||  indexPath.row == 2{
            
            return 91
            
        }else if indexPath.row == 3{
            
            return 37
            
        }else{
            
           return 110
    }
        
    }
}
