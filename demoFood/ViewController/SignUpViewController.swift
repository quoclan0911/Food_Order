//
//  RegisterViewController.swift
//  demoFood
//
//  Created by ASU on 7/13/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import MBProgressHUD

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func saveUserToDataBase(email: String, uid: String, name: String, address: String, phone: String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let data = ["email": email,
                    "uid": uid,
                    "name": name,
                    "address": address,
                    "phone": phone
                    ]
        
        FirebaseManager.shared.ref.child("Users/\(uid)").setValue(data) { [weak self] (error, databaseRef) in
            MBProgressHUD.hide(for: self!.view, animated: true)
            if let error = error {
                print("Loi: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func didClickCreateAccount(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let name = nameTextField.text,
            let address = addressTextField.text,
            let phone = phoneTextField.text,
            email != "",
            password != "",
            name !=  "",
            address != "",
            phone != ""
            else {
            
                return
        }
        
        guard isValidEmail(email) else { return }
        
        if password.count < 6 {
            
        }
        
        Auth.auth().createUser(withEmail: email, password: password ) { [weak self] (result, error) in
            guard let self = self else { return }
            if let result = result {
                self.saveUserToDataBase(email: email, uid: result.user.uid, name: name, address: address, phone: phone)
//                let popup = UIAlertController(title: "Thông báo", message: "Tài khoản được tạo thành công", preferredStyle: .alert)
//                let retype = UIAlertAction(title: "Nhập lại", style: .default) { (action) in
                 //   self.dismiss(animated: true, completion: nil)
//                }
//
//                popup.addAction(retype)
//                self.present(popup, animated: true, completion: nil)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
                print("Loi: \(error?.localizedDescription)")
            }
            
        }
        
        
    }
    
}
