//
//  EditFoodViewController.swift
//  demoFood
//
//  Created by ASU on 5/23/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import MBProgressHUD
import FirebaseDatabase


class EditFoodViewController: UIViewController {
    
    @IBOutlet weak var nameFoodTextField: UITextField!
    @IBOutlet weak var quantityFoodTextField: UITextField!
    @IBOutlet weak var moneyFoodTextField: UITextField!
    @IBOutlet weak var inforFoodTextField: UITextField!
    
    @IBOutlet weak var avatarImageFood: UIImageView!
    
    var avatarURL: String?
    
    var food: FoodModel?
    
    var titleFood: String?
    
    var tempEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeHolder()
        
        switch tempEdit {
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
          
        
        print("tema edit eidt edit edit edit \(tempEdit)")
    }
    
    //MARK: - helper
    func placeHolder() {
        nameFoodTextField.placeholder = food?.nameFood!
        quantityFoodTextField.placeholder = food?.quantityFood!
        moneyFoodTextField.placeholder = food?.moneyFood!
        inforFoodTextField.placeholder = food?.information!
        if let avatar = food?.avatarFood  {
            let url = URL(string: avatar)
            do {
                let data = try Data(contentsOf: url!)
                self.avatarImageFood.image = UIImage(data: data)
            } catch { print("Error") }
        }
    }
    
    
    //
    //    private func saveFoodsToDataBase(name: String, avatar: String, quantity: String, money: String, description: String) {
    //        MBProgressHUD.showAdded(to: self.view, animated: true)
    //        let data = [
    //            "name": name,
    //            "avatar": avatar,
    //            "quantity": quantity,
    //            "money": money,
    //            "description": description
    //            ] as [String : Any]
    //
    //        FirebaseUpdate.shared.ref.child("Cafe").childByAutoId().key
    //
    //        let childUpdates = ["/Cafe/\(key)": data,
    //        "/user-posts/\(userID)/\(key)/": post]
    
    //   }
    
    //MARK: - Action
    @IBAction func didCLuuButton(_ sender: Any) {
        
        if let quantity = quantityFoodTextField.text,
            let money = moneyFoodTextField.text,
            let name = nameFoodTextField.text,
            let infor = inforFoodTextField.text,
            quantity != "", money != "", name != "" {
            
            
  
            let data = [
                "name": name,
                "quantity": quantity,
                "money": money,
                "description": infor,
                "avatar": ""
            ]
            
        FirebaseManager.shared.ref.child("\(titleFood)/\(food?.id)").updateChildValues(data) { [weak self] (error, dataRef) in
                guard let self = self else { return }
                if let error = error {
                    print("Loi update: \(error.localizedDescription)")
                } else {
                    
                }
            }
            
        }
    }
    
    @IBAction func didClickChooseIamge(_ sender: Any) {
        let alert = UIAlertController(title: "Chọn Ảnh", message: "", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Thư viện ảnh", style: .default) { [weak self] (action) in
            // weak self : tránh leak mmemory
            guard let self = self else { return }
            self.openGallery()
        }
        let cancel = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        alert.addAction(galleryAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openGallery() {
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

extension EditFoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let url = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerImageURL")] as? URL{
            avatarURL = url.absoluteString
            
        }
        
        if let image = info[.editedImage] as? UIImage {
            avatarImageFood.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

