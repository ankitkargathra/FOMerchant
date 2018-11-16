//
//  iPadLoginViewController.swift
//  DemoTableView
//
//  Created by Urja_Macbook on 23/09/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import SCPageControl

class iPadLoginViewController: BaseViewController {

    @IBOutlet var txtEmail : RaisePlaceholder!
    @IBOutlet var txtPassword : RaisePlaceholder!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var viewIntroScreen: UIView!
    
    
    var textArray = [String]()
    var descArray = [String]()
    let sc = SCPageControlView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.validateTextField(type: .Email, minLength: 10, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Email")
        txtPassword.validateTextField(type: .Password, minLength: 6, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Password")
        self.SetUp()
        // Do any additional setup after loading the view.
    }
    
    func SetUp(){
        collectionView.dataSource = self
        collectionView.delegate = self
        textArray.append(EPConstant.Intro.INTRO_HEADER_1)
        textArray.append(EPConstant.Intro.INTRO_HEADER_2)
        textArray.append(EPConstant.Intro.INTRO_HEADER_3)
        
        descArray.append(EPConstant.Intro.INTRO_DES_1)
        descArray.append(EPConstant.Intro.INTRO_DES_2)
        descArray.append(EPConstant.Intro.INTRO_DES_3)
        var y : CGFloat = 0.0
        if GenericClass.sharedInstance.iPhoneX()
        {
            y = 30.0
        }
        sc.frame = CGRect(x: -10, y: y+15, width: UIScreen.main.bounds.size.width, height: 100)
        sc.scp_style = .SCJAFlatBar
        sc.set_view(3, current: 0, tint_color: UIColor.darkGray)
        view.addSubview(sc)
    }
    
    @IBAction func btnFogotPasswordPressed(_ sender: UIButton) {
        
        let vc = EPConstant.Storyboard.AuthenticationStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kLoginViewController)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - Collecton Delegate Methods -
extension iPadLoginViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IntroCollectionCell
//        cell.lblTitle.text = textArray[indexPath.item]
//        cell.lblDescription.text = descArray[indexPath.item]
//        cell.imgView.image = #imageLiteral(resourceName: "imgIntro")//UIImage(named: "intro\(indexPath.item)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.viewIntroScreen.frame.size.width, height: UIScreen.main.bounds.size.height - 40)
    }
}

//MARK: - ScrollView Delegate methods -
extension iPadLoginViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        sc.scroll_did(scrollView)
    }
}

