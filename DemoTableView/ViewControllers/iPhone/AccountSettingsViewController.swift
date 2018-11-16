//
//  AccountSettingsViewController.swift
//  DemoTableView
//
//  Created by Solulab_Vicky on 05/10/18.
//  Copyright © 2018 Rajat Lala. All rights reserved.
//

import UIKit
import KFImageViewer

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
    
    
    var arrRestrutantImage = JSONDICTIONARY()
    
    override func viewDidLoad(){
        setUpSideMenu(isShow: true, title: "Account Settings")
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        txtName.validateTextField(type: .Email, minLength: 10, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Name")
        txtPhoneNumber.validateTextField(type: .Mobile, minLength: 6, maxLength: 100, alignment: NSTextAlignment.left, placeHolder: "Phone Number")
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 850)
        btnChangePhoto.setTitle("Change Photo", for: .normal)
        txtEmail.isEnabled = false
        txtEmail.textColor = EPConstant.Colors.TEXT_GREY_THEME
        
        
        txtName.text = "Domino's Pizza"
        txtEmail.text = "support@dominos.com"
        txtPhoneNumber.text = "84201048579342"
        cnsHeightViewBanners.constant = 200
        btnChangePhoto.imgePick = { (img) in
         self.imgProfilePic.image = img
//         let tapGest = UITapGestureRecognizer(target: self, action: #selector(self.tapImageView))
//         tapGest.numberOfTapsRequired = 1
//         tapGest.cancelsTouchesInView = false
//         self.imgProfilePic.addGestureRecognizer(tapGest)
        }
    }
    
//    @objc func tapImageView(){
//        let fullScreenController = FullScreenSlideshowViewController()
//        let photo:[InputSource] = [imgProfilePic!.image as! InputSource]
//        fullScreenController.inputs = photo
//        present(fullScreenController, animated: true, completion: nil)
//    }
    
    
    @IBAction func btnUpdatePressed(_ sender: EPButtonGreenButton) {
        
//        if txtName.validateTextFiled(validationMesage: .invalidEmail) {
//          if txtView.text.trim().count == 0 {
//            if txtPhoneNumber.validateTextFiled(validationMesage: .invalidMobile) {
//                GenericClass.sharedInstance.CallUpdateProfileApi(name: txtName.text!, phone: txtPhoneNumber.text!, address: txtView.text!, picture: imgProfilePic.image!) { (isSuccess) in
//                    if isSuccess{
//
//                    }
//                }
//            }
//          }else{
//                self.showToast(msg: DEFAULT_ADDRESS_VALID)
//            }
//        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AccountSettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1//arrRestrutantImage.count+1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AccountSettingImageCell
//        let data = self.coachList.list[indexPath.item]
//        cell.imgView.sd_setImage(with: URL(string: "\(IMAGE_URL)\(data.profilePic!)"), placeholderImage: MALE_LIST_PLACEHOLDER_IMAGE, options: .highPriority, completed: nil)//
//        cell.imgView.image = arrRestrutantImage[indexPath.row] as? String //UIImage(named: "intro\(indexPath.item)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/3 - 16, height: 80)
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return pendingImageString.count + 1 // + 1 for last cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AccountSettingImageCell
//        cell.btnRemoveImg.tag = indexPath.row
//        cell.btnAddImg.tag = indexPath.row
//
//        if indexPath.item == arrRestrutantImage.count {
////            cell.imageview = //your static image that is shown in last cell
//                //cell.cancelButton.isHidden = true
//        }
//        else{
////            let img:NSString = pendingImageString[indexPath.item]
////            cell.editImage.sd_setImageWithURL(NSURL(string: imageApikey + (img as String)))
////            cell.cancelButton.isHidden = false
//        }
//        return cell
//
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == arrRestrutantImage.count{
            // update your array with new image file
        }
    }
    
    // cancel button action
    func buttonClicked(sender: UIButton?) {
        let tag = sender?.tag
        // remove object from array and reload collectionview
    }
    
}
