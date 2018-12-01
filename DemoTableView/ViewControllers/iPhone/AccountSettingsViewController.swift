//
//  AccountSettingsViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 05/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit

class AccountSettingsViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var btnChangePhoto: SLButtonImagePicker!
    @IBOutlet weak var txtName: RaisePlaceholder!
    @IBOutlet weak var txtEmail: RaisePlaceholder!
    @IBOutlet weak var txtPhoneNumber: RaisePlaceholder!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cnsHeightViewBanners: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgProfilePic: EPImageView!
    
    
    var arrPictureList:NSMutableArray = []
    
    override func viewDidLoad(){
        setUpSideMenu(isShow: true, title: "Account Settings")
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        txtName.validateTextField(type: .Normal, minLength: 5, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Name")
        txtPhoneNumber.validateTextField(type: .Mobile, minLength: 6, maxLength: 15, alignment: NSTextAlignment.left, placeHolder: "Phone Number")
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 850)
        scrollView.clipsToBounds = true
        btnChangePhoto.setTitle("Change Photo", for: .normal)
        txtEmail.isEnabled = false
        txtEmail.textColor = EPConstant.Colors.TEXT_GREY_THEME
        txtEmail.text = kCurrentUser.email
        cnsHeightViewBanners.constant = 100
        getUserProfileDetails()
        getUserProfileImages()
        btnChangePhoto.imgePick = { (img) in
            self.imgProfilePic.image = img
        }
        
    }
    
    @IBAction func btnUpdatePressed(_ sender: EPButtonGreenButton) {
        
        if txtName.validateTextFiled(validationMesage: .invalidEmail) {
            if txtView.text.trim().count > 0 {
                if txtPhoneNumber.validateTextFiled(validationMesage: .invalidMobile) {
                    GenericClass.sharedInstance.CallUpdateProfileApi(name: txtName.text!, phone: txtPhoneNumber.text!, address: txtView.text!, picture: imgProfilePic.image!) { (isSuccess, message, dictionary) in
                        if isSuccess{
                            if let responseDict = dictionary
                            {
                                var dict = responseDict["data"] as! JSONDICTIONARY
                                dict["access_token"] = UserRootClass.shared.accessToken
                                dict["email"] = UserRootClass.shared.email
                                dict["is_confirm"] = UserRootClass.shared.isConfirm
                                self.getUserData(dict:dict)
                                if responseDict["message"] != nil{
                                    self.showToast(msg: responseDict["message"] as! String)
                                }
                            }
                        }
                    }
                }
            }else{
                self.showToast(msg: DEFAULT_ADDRESS_VALID)
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AccountSettingsViewController{
    
    func UpdateProfile(){
        txtName.text = kCurrentUser.restaurantName
        txtView.text = kCurrentUser.restaurantAddress
        txtPhoneNumber.text = kCurrentUser.restaurantPhone
        imgProfilePic.sd_setImage(with: URL(string: "\(IMAGE_URL)\(kCurrentUser.restaurantPicture!)"), placeholderImage: RESTUTANT_PLACEHOLDER_IMAGE, options: .highPriority, completed: nil)
    }
    
    func getUserData(dict:JSONDICTIONARY){
        UserRootClass.shared.parseDict(fromDictionary: dict)
        UserRootClass.shared.saveToDefaults()
        self.UpdateProfile()
        NotificationCenter.default.post(name: NSNotification.Name.init("refreshData"), object: nil)
    }
    
    func getUserProfileDetails(){
        GenericClass.sharedInstance.CallgetProfileApi(id: kCurrentUser.id, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    let arr = responseDict["data"] as! NSArray
                    var dict = arr[0] as! JSONDICTIONARY
                    dict["access_token"] = UserRootClass.shared.accessToken
                    dict["email"] = UserRootClass.shared.email
                    dict["is_confirm"] = UserRootClass.shared.isConfirm
                    self.getUserData(dict:dict)
                }
            }
        })
    }
    
    func getUserProfileImages(){
        GenericClass.sharedInstance.CallgetRestuarantImagesApi(id: kCurrentUser.id, completion: { (isSuccess, message, dictionary) in
            if isSuccess{
                if let responseDict = dictionary{
                    if responseDict["data"] != nil {
                        if let picture = responseDict["data"] as? NSArray
                        {
                            for i in 0..<picture.count
                            {
                                let pic = picture[i] as! JSONDICTIONARY
                                self.arrPictureList.add(pic)
                            }
                            self.collectionView.reloadData()
                        }
                        
                    }
                }
            }
        })
    }
}

extension AccountSettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrPictureList.count != 0 ? arrPictureList.count+1 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AccountSettingImageCell
        cell.btnAddImg.layer.borderColor = UIColor.clear.cgColor
        if self.arrPictureList.count == 0{
            cell.btnAddImg.setTitle("Add Photo", for: .normal)
            let borderLayer  = GenericClass.sharedInstance.dashedBorderLayerWithColor(color: UIColor.gray.cgColor, view: cell.viewBorder)
            cell.viewBorder.layer.addSublayer(borderLayer)
            cnsHeightViewBanners.constant = 100
        }else{
            if indexPath.row == arrPictureList.count{
                cell.btnAddImg.setTitle("Add Photo", for: .normal)
                cell.viewBorder.frame = CGRect(x: 2, y: 2, width: UIScreen.main.bounds.size.width/3 - 20, height: 76)
                let borderLayer  = GenericClass.sharedInstance.dashedBorderLayerWithColor(color: UIColor.gray.cgColor, view: cell.viewBorder)
                cell.viewBorder.layer.addSublayer(borderLayer)
            }else{
                let data = self.arrPictureList[indexPath.row] as! JSONDICTIONARY
                cell.imgView.sd_setImage(with: URL(string: data["picture"] as! String), placeholderImage: RESTUTANT_PLACEHOLDER_IMAGE, options: .highPriority, completed: nil)
                cell.viewBorder.isHidden = true
                cell.imgView.layer.cornerRadius = 5.0
                cell.imgView.clipsToBounds = true
               cell.contentView.bringSubview(toFront: cell.imgView)
               cell.btnRemoveImg.isHidden = false
            }
            cell.btnRemoveImg.tag = indexPath.row
        }
        cell.btnAddImg.imgePick = { (img) in
            cell.imgView.image = img
            cell.contentView.bringSubview(toFront: cell.imgView)
//            GenericClass.sharedInstance.CallAddRestrutantPictureApi(restrutantId: kCurrentUser.id, picture: img, completion: { (isSuccess, message, dictionary) in
//                if isSuccess{
//                    if let responseDict = dictionary{
//                        print(responseDict["data"]!)
//                        cell.btnRemoveImg.isHidden = false
//                        self.getUserProfileImages()
//                    }
//                }
//            })
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/3 - 16, height: 80)
    }
    
    // cancel button action
//    func buttonClicked(sender: UIButton?) {
//        let tag = sender?.tag
//        // remove object from array and reload collectionview
//    }
    
}
