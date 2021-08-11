//
//  AddFoodViewController.swift
//  demoFood
//
//  Created by ASU on 5/20/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import MBProgressHUD

protocol AddFoodDelegate: class {
    func passingData(foodModel: FoodModel)
}

class AddFoodViewController: UIViewController {
    
    var temp: Int?
    
    @IBOutlet weak var nameFoodTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var moneyFoodTextField: UITextField!
    @IBOutlet weak var informationFoodTextField: UITextField!
    @IBOutlet weak var avatarFoodImageView: UIImageView!
    
   
    var checkChoseImage = 0
    var link: String = ""
    var titleFood: String?
    var ref: DatabaseReference!
    let uid = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        switch temp {
        case 1:
            titleFood = "Cafe"
        case 2:
            titleFood = "MilkTea"
        case 3:
            titleFood = "Drink"
        case 4:
            titleFood = "FastFood"
        case 5:
            titleFood = "Rice"
        default:
            titleFood = "Meat"
        }
    }
    
    //MARK: - Helper
    private func saveFoodsToDataBase(title: String, uid: Int, avatar: String, name: String, quantity: String, money: String, description: String) {
        
        let data = [
            "uid": uid,
            "name": name,
            "quantity": quantity,
            "avatar": avatar,
            "money": money,
            "description": description
            ] as [String : Any]
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.ref.child("\(title)/\(uid)").setValue(data) { [weak self] (error, databaseRef) in
            MBProgressHUD.hide(for: self!.view, animated: true)
            if let error = error {
                print("Loi: \(error.localizedDescription)")
            }
        }
    }
    
//    func updateInfo(_ info: [String: Any], completion: @escaping((Error?) -> ())) {
//        FirebaseManager.shared.ref.child("\(titleFood)/\(uid)").updateChildValues(info) { (error, dataRef) in
//            if let error = error {
//                completion(error)
//                return
//            }
//            completion(nil)
//        }
//    }
//
    //MARK: - Action
    @IBAction func didClickSaveButton(_ sender: Any) {
        
        if let name = nameFoodTextField.text,
            let quantity = quantityTextField.text,
            let money = moneyFoodTextField.text,
            let description = informationFoodTextField.text,
            name != "", quantity != "", money != "", description != "" {
        
            saveFoodsToDataBase(title: titleFood!, uid: uid, avatar: link, name: name, quantity: quantity, money: money, description: description)
        } else {
            let popup = UIAlertController(title: "Thông báo", message: "Vui lòng nhập đầy đủ thông tin và chọn ảnh mới!", preferredStyle: .alert)
            let retype = UIAlertAction(title: "Nhập lại", style: .default) { (action) in
            }
            popup.addAction(retype)
            self.present(popup, animated: true, completion: nil)
        }
        
        if checkChoseImage == 0 {
            let popup = UIAlertController(title: "Thông báo", message: "Vui lòng nhập đầy đủ thông tin và chọn ảnh mới!", preferredStyle: .alert)
            let retype = UIAlertAction(title: "Nhập lại", style: .default) { (action) in
            }
            popup.addAction(retype)
            self.present(popup, animated: true, completion: nil)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickChooseImage(_ sender: Any) {
        checkChoseImage = 1
        let alert = UIAlertController(title: "Chọn Ảnh", message: "", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Thư viện ảnh", style: .default) { [weak self] (action) in
            // weak self : tránh leak mmemor
            guard let self = self else { return }
            self.openGallery()
        }
        let cancel = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        alert.addAction(galleryAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openGallery() {
        checkChoseImage = 1
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
        } else {
            let alert  = UIAlertController(title: "Lỗi rồi!", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - UIImagePickerControllerDelegate
extension AddFoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
            return
        }
                
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            FirebaseUpdate.shared.updateImage(image: pickedImage, name: imageURL.lastPathComponent) { [weak self] (url) in
                guard let self = self else { return }
                if let url = url {
                    self.link = url.absoluteString
                }
            }
            avatarFoodImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
