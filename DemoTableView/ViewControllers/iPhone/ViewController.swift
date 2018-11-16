//
//  ViewController.swift
//  Trupr
//
//  Created by Aabid Khan on 7/25/18.
//  Copyright © 2018 Aabid Khan. All rights reserved.
//

import UIKit
import SCPageControl

public enum SCPageStyle: Int {
    case SCNormal = 100
    case SCJAMoveCircle
    case SCJAFillCircle
    case SCJAFlatBar
}

class ViewController: BaseViewController{

    @IBOutlet var collectionView: UICollectionView!
    
    var textArray = [String]()
    var descArray = [String]()
    var ImgArray = [UIImage]()
    let sc = SCPageControlView()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetUp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions -
    func goToLoginScreen(){
        let vc = EPConstant.Storyboard.AuthenticationStoryboard.instantiateViewController(withIdentifier: EPConstant.ViewControllerIdentifiers.kLoginViewController)
        self.navigationController?.pushViewController(vc, animated: true)
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
        
        ImgArray.append(EPConstant.IntroImage.INTRO_IMG_1)
        ImgArray.append(EPConstant.IntroImage.INTRO_IMG_2)
        ImgArray.append(EPConstant.IntroImage.INTRO_IMG_3)
        
        var y : CGFloat = 0.0
        if GenericClass.sharedInstance.iPhoneX()
        {
            y = 30.0
        }
        sc.frame = CGRect(x: -10, y: y+5, width: UIScreen.main.bounds.size.width, height: 100)
        sc.scp_style = .SCJAFlatBar
        sc.set_view(3, current: 0, tint_color: UIColor.darkGray)
        view.addSubview(sc)
    }
    
    //MARK: - Actions -
    @objc func buttonSignInPressed(){
     self.goToLoginScreen()
    }
}
//MARK: - Collecton Delegate Methods -
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IntroCollectionCell
       cell.lblTitle.text = textArray[indexPath.item]
       cell.lblDescription.text = descArray[indexPath.item]
       cell.lblDescription.setLineSpacing(lineSpacing: 2.5, lineHeightMultiple: 1.0)
       cell.lblDescription.textAlignment = .center
        cell.imgView.image = indexPath.item == 1 ? ImgArray[indexPath.item] : ImgArray[indexPath.item].withAlignmentRectInsets(UIEdgeInsets(top: -25, left: 0, bottom: -20, right: 0))
       cell.btnSignIn.addTarget(self, action: #selector(buttonSignInPressed), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
}

//MARK: - ScrollView Delegate methods -
extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        sc.scroll_did(scrollView)
    }
}


