//
//  BaseViewController.swift
//  DemoTableView
//
//  Created by Urja_Macbook on 16/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import LoadingPlaceholderView
import MBProgressHUD
import SDWebImage

class BaseViewController: UIViewController {
    var headerViewDefault: HeaderViewDefault!
    var headerViewButtons: HeaderViewBackButton!
    var alertButtons : AlertWithButtons?
    var customInfoView : CustomInfoView?
    //    var slTableVC : SLTableViewController!
    //    var hud : YBHud!
    var refresher = UIRefreshControl()
    var isPullToRefresh = false
    static let shared = BaseViewController()
    var loadingPlaceholderView = LoadingPlaceholderView()
    
    @IBOutlet weak var viewTop: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if self.headerViewDefault != nil
        {
            self.headerViewDefault.delegate = self
        }
        
        if self.headerViewButtons != nil
        {
            self.headerViewButtons.delegate = self
        }
        
        setUpSideMenu()
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGest.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGest)
        
        if GenericClass.sharedInstance.iPhoneX() && viewTop != nil
        {
            viewTop.constant = 84.0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions -
    
    func setUpSideMenu(isShow:Bool! = false, title:String = ""){
        if isShow {
            SJSwiftSideMenuController.navigator.setNavigationBarHidden(false, animated: true)
            SJSwiftSideMenuController.navigator.navigationBar.backgroundColor = UIColor.white
            SJSwiftSideMenuController.navigator.topViewController?.navigationItem.title = title
            SJSwiftSideMenuController.enableSwipeGestureWithMenuSide(menuSide: .LEFT)
            if let image : UIImage = UIImage(named: "menu") as UIImage? {
                SJSwiftSideMenuController.showLeftMenuNavigationBarButton(image: image)
            }
        }
    }
    
    
    @objc func loadData() {
        
    }
    
    func addPullToRefresh(vw : UIView) {
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        vw.addSubview(refresher)
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
    }
    func showHUD(str : String = "",showInView : Bool = false,hideLoader : Bool = false){
        if !hideLoader {
            MBProgressHUD.showAdded(to: AppDel.window!,    animated: true)
        }
    }
    
    func hideHUD(){
        ApiController.sharedInstace.hideLoader = false
        MBProgressHUD.hide(for: AppDel.window!,    animated: true)
    }
    
    func showAlertButtons(message : String)
    {
        if alertButtons == nil{
            alertButtons = .fromNib() as AlertWithButtons
        }
        alertButtons?.alertButtonDelegate = self
        alertButtons?.lblMessage.text = message
        alertButtons?.frame = AppDel.window!.frame        
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations:
            {
                AppDel.window!.addSubview(self.alertButtons!)
                
        }, completion: nil)
    }
    
    func hideAlertButtons()
    {
        if let alertView = alertButtons{
            alertView.removeFromSuperview()
        }
        
        if let vw = customInfoView{
            vw.removeFromSuperview()
        }
    }
    
    func showCustomInfoViewWith(title : String,Message:String,ShowOkButton:Bool,ShowCloseButton:Bool)
    {
        if customInfoView == nil{
            customInfoView = .fromNib() as CustomInfoView
        }
        
        customInfoView?.alertButtonDelegate = self
        customInfoView?.lblMessage.text = Message
        customInfoView?.lblTitle.text = title
        
        customInfoView?.btnOkHeight.constant = 0
        
        if ShowOkButton
        {
            customInfoView?.btnOkHeight.constant = 45
        }
        
        customInfoView?.frame = AppDel.window!.frame
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations:
            {
                AppDel.window!.addSubview(self.customInfoView!)
                
        }, completion: nil)
    }
    
    func addShadow(vw : UIView)
    {
        vw.layer.shadowRadius = 10;
        vw.layer.masksToBounds = false;
        vw.layer.shadowColor = UIColor.black.cgColor;
        vw.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        vw.layer.shadowOpacity = 0.1;
    }
    
    @objc func hideKeyboard()
    {
        self.view.endEditing(true)
    }
    
    func loadDefaultHeaderView(title : String)
    {
        headerViewDefault = .fromNib() as HeaderViewDefault
        headerViewDefault.lblTitle.text = title
        var y : CGFloat = 0.0
        
        if GenericClass.sharedInstance.iPhoneX()
        {
            y = 20.0
        }
        
        headerViewDefault.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)
        
        if GenericClass.sharedInstance.iPhoneX()
        {
            headerViewDefault.viewHeight.constant = 64 + y
        }
        
        self.view.addSubview(headerViewDefault)
    }
    
    func loadHeaderViewBackButton(title : String, subTitle: String = "")
    {
        headerViewButtons = .fromNib() as HeaderViewBackButton
        headerViewButtons.lblTitle.text = title
        headerViewButtons.lblSubTitle.text = subTitle
        var y : CGFloat = 0.0
        var subTitleHeight : CGFloat = 0.0
        
        if GenericClass.sharedInstance.iPhoneX()
        {
            y = 20.0
        }
        if subTitle.count > 0{
            subTitleHeight = 20.0
        }else{
            subTitleHeight = 0.0
            headerViewButtons.lblSubTitle.isHidden = true
        }
        headerViewButtons.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64 + subTitleHeight)
        
        if GenericClass.sharedInstance.iPhoneX()
        {
            headerViewButtons.viewHeight.constant = 64 + y + subTitleHeight
        }
        self.view.addSubview(headerViewButtons)
    }
    
    func showDefaultAlertView(msg : String)
    {
        let alertVc = UIAlertController.init(title:"", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
        }
        alertVc.addAction(okAction)
        AppDel.window?.rootViewController?.present(alertVc, animated: true, completion: nil)
    }
    
    func showToast(msg : String){
        
        let view = UIView(frame: CGRect(x: 0, y: AppDel.window!.frame.height, width: AppDel.window!.frame.width, height: 0))
        let lblText = UILabel(frame: CGRect(x: 20, y: 10, width: AppDel.window!.frame.width - 40, height: 20.0))
        lblText.font = Font.setFont(name: AvenirNextLTPro_Medium, size: getProportionalFont(size:16.0))
        lblText.textAlignment = .left
        lblText.numberOfLines = 0
        view.backgroundColor = UIColor.clear
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear, .curveEaseInOut], animations:{
            
            view.frame = CGRect(x: 0, y: AppDel.window!.frame.height - 40, width: AppDel.window!.frame.width, height: 40)
            lblText.frame = CGRect(x: 20, y: 10, width: AppDel.window!.frame.width, height: 20.0)
            lblText.textColor = UIColor.white
            view.backgroundColor = UIColor.black
            view.alpha = 0.9
            lblText.text = msg
            view.addSubview(lblText)
            AppDel.window?.addSubview(view)
            self.perform(#selector(self.hideToast(view:)), with: view, afterDelay: 2.0)
            
        },completion: nil)
    }
    
    @objc func hideToast(view:UIView){
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear, .curveEaseInOut], animations:{
            view.backgroundColor = UIColor.clear
            view.frame = CGRect(x: 0, y: AppDel.window!.frame.height, width: view.frame.width, height: 40)
        })
    }
    
    
    func navigateFromSideMenu(){
        
        let mainVC = SJSwiftSideMenuController()
        let sideVC : SideMenuViewController = (EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kSideMenuController) as? SideMenuViewController)!
        let rootVC = EPConstant.Storyboard.MainStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kMainViewController) as! MainViewController
        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC, leftMenuController: sideVC, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideOver)
        SJSwiftSideMenuController.enableDimbackground = true
        SJSwiftSideMenuController.leftMenuWidth = UIScreen.main.bounds.size.width*0.80
        AppDel.window?.rootViewController = mainVC
        AppDel.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func toggleLeftSideMenutapped(_ sender: AnyObject) {
        SJSwiftSideMenuController.toggleLeftSideMenu()
    }
}

//MARK: Header Delegate
extension BaseViewController : HeaderViewActionsProtocol{
    
    func searchTapped() {
    }
    
    func menuTapped()
    {
        //self.sideMenuController().openMenu()
    }
    
}
//MARK: Alert Delegate
extension BaseViewController : AlertViewButtonsDelegate{
    func btnYesTapped() {
        hideAlertButtons()
    }
    func btnNoTapped() {
        hideAlertButtons()
    }
}


