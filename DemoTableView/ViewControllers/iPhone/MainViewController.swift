//
//  MainViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 03/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class MainViewController: BaseViewController, UIScrollViewDelegate {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    var RequestOrderVC = RequestOrderViewController()
    var PendingOrderVC = PendingOrderViewController()
    var PastOrderVC    = PastOrderViewController()
    var tabView: TabView!
    var isSwipe0:Bool = true
    var isSwipe1:Bool = true
    var isSwipe2:Bool = true
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadTabViewinHeader()
        self.tabView.delegate = self
        self.tabView.btn0.isSelected = true
        CollectionView.delegate = self
        CollectionView.dataSource = self
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "btnPastTapped"), object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(btnPastTapped), name:NSNotification.Name(rawValue: "btnPastTapped"),object: nil)
        CollectionView.register(UINib(nibName: "orderList" , bundle: nil), forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        setUpSideMenu(isShow: true, title: "Welcome")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTabViewinHeader(){
        tabView = .fromNib() as TabView
        tabView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 40)
        self.view.addSubview(self.tabView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        if Devices.screenWidth >= 2208/3{
            self.tabView.underlineView.frame.origin.x = (scrollView.contentOffset.x + 5) / 3
        }else{
            self.tabView.underlineView.frame.origin.x = (scrollView.contentOffset.x + 35) / 3
        }
        if self.tabView.underlineView.frame.origin.x < UIScreen.main.bounds.size.width / 3{
            self.tabView.btn0.isSelected = true
            self.tabView.btn1.isSelected = false
            self.tabView.btn2.isSelected = false
        }else if self.tabView.underlineView.frame.origin.x < UIScreen.main.bounds.size.width / 2{
            self.tabView.btn1.isSelected = true
            self.tabView.btn0.isSelected = false
            self.tabView.btn2.isSelected = false
        }
        else{
            self.tabView.btn1.isSelected = false
            self.tabView.btn0.isSelected = false
            self.tabView.btn2.isSelected = true
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabCell
            if indexPath.item == 0{
                self.perform(#selector(self.addRequestOrderVC(cell:)), with: cell, afterDelay: 0.1)
                return cell
            }
            else if indexPath.item == 1{
                self.perform(#selector(self.addPendingOrderVC(cell:)), with: cell, afterDelay: 0.1)
                return cell
            }
            else if indexPath.item == 2{
                self.perform(#selector(self.addPastOrderVC(cell:)), with: cell, afterDelay: 0.1)
                return cell
            }
        return UICollectionViewCell()
    }
    
    @objc func addRequestOrderVC(cell: TabCell) {
        RequestOrderVC =  EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kRequestOrderViewController) as! RequestOrderViewController
        RequestOrderVC.view.frame = cell.bounds
        RequestOrderVC.RequestOrderDelegate = self
        cell.addSubview(RequestOrderVC.view)
    }
    
    @objc func addPendingOrderVC(cell: TabCell) {
        PendingOrderVC = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kPendingOrderViewController) as! PendingOrderViewController
        PendingOrderVC.view.frame = cell.bounds
        PendingOrderVC.pendingOrderDelegate = self
        cell.addSubview(PendingOrderVC.view)
    }
    
    @objc func addPastOrderVC(cell: TabCell) {
        PastOrderVC = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kPastOrderViewController) as! PastOrderViewController
        PastOrderVC.view.frame = cell.bounds
        cell.addSubview(PastOrderVC.view)
    }
}

extension MainViewController : TabViewViewActionsProtocol{
    func btnRequestTapped() {
        self.tabView.btn1.isSelected = false
        self.tabView.btn0.isSelected = true
        self.tabView.btn2.isSelected = false
        CollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func btnPendingTapped() {
        self.tabView.btn1.isSelected = true
        self.tabView.btn0.isSelected = false
        self.tabView.btn2.isSelected = false
        CollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func btnPastTapped() {
        self.tabView.btn2.isSelected = true
        self.tabView.btn0.isSelected = false
        self.tabView.btn1.isSelected = false
        CollectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredHorizontally, animated: true)
    }
}

