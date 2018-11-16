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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Devices.isIphone{
            if Devices.screenHeight >= 2436/3{
                cnsTopView.constant = 40.0
            }
        }
        tblViewPastOrder.dataSource = self
        tblViewPastOrder.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDetailsPressed(_ sender: UIButton) {
   
        let vc = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kDetailsOrderViewController) as! DetailsOrderViewController
        SJSwiftSideMenuController.pushViewController(vc, animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PastOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idstr = "cell"
        var cell : UITableViewCell! = tblViewPastOrder.dequeueReusableCell(withIdentifier: idstr)!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idstr)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 123
        
    }
}

