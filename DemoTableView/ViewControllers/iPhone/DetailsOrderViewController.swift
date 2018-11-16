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
    
    override func viewDidLoad() {
        setUpSideMenu(isShow: false)
        SJSwiftSideMenuController.navigator.setNavigationBarHidden(true, animated: true)
        loadHeaderViewBackButton(title: "Order #568",subTitle: "by Magnus")
        self.headerViewButtons.btnMenu.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func menuTapped(){
        
      self.navigationController?.popViewController(animated: true)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension DetailsOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.row == 0 || indexPath.row == 1{
            let idstr = "cell"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 2{
            
            let idstr = "cellTotal"
            var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: idstr)!
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
            }
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 3{
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 ||  indexPath.row == 1{
            
            return 118
            
        }else if indexPath.row == 2{
            
            return 114
            
        }else{
            
            return 102
        }
    }
}
