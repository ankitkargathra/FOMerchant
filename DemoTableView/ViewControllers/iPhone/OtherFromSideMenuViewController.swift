//
//  OtherFromSideMenuViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 04/11/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class OtherFromSideMenuViewController: BaseViewController {

    var strHeader:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideMenu(isShow: true, title: strHeader)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
