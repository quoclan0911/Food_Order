//
//  LoginViewController.swift
//  demoFood
//
//  Created by ASU on 7/12/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var bottomLoginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var errorLogin: UILabel!
    
    
    @IBAction func resighKeyBoard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    private var ref: DatabaseReference!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: - Helper
    @objc func keyboardWillShow(_ sender: NSNotification) {
        if let rect = sender.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            bottomLoginConstraint.constant = rect.cgRectValue.height + 17
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(_ sender: NSNotification){
        
        if view.safeAreaInsets.bottom != 0 {
            bottomLoginConstraint.constant = view.safeAreaInsets.bottom
        } else {
            bottomLoginConstraint.constant = 17
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func showHomeScreen() {
        saveLoginSuccess()
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(identifier: "HomeViewController")
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false, completion: nil)
//        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func signIn(crediential: AuthCredential) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Auth.auth().signIn(with: crediential) { [weak self] (result, error) in
            
            MBProgressHUD.hide(for: self!.view, animated: true)
            guard let self = self else { return }
            
            if let error = error {
                self.errorLogin.text = error.localizedDescription
                return
            }
            
            if result?.user != nil {
                self.errorLogin.text = ""
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.showHomeScreen()
            }
        }
        
    }
    
    private func saveLoginSuccess() {
        UserDefaults.standard.setValue(true, forKey: "kIsLogin")
    }
    //MARK: - Action
    @IBAction func didClickLoginButton(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            email != "", password != ""
            
            else {
                errorLogin.text = "Vui lòng nhập đầy đủ thông tin!"
                return
        }
        
        guard isValidEmail(email) else {
            errorLogin.text = "Nhập đúng định dạng email!"
            return
        }
        
        if password.count < 6 {
            errorLogin.text = "Mật khẩu phải trên 6 ký tự!"
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Auth.auth().signIn(withEmail: email, password: password ) { [weak self] (result, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = error {
                var errorShow: String = ""
                let errorIdentifier = "There is no user record corresponding to this identifier. The user may have been deleted."
                let errorPassword = "The password is invalid or the user does not have a password."
                
                switch error.localizedDescription {
                case errorPassword:
                    errorShow = "Mật khẩu sai!"
                case errorIdentifier:
                    errorShow = "Tài khoản không tồn tại!"
                default:
                    return
                }
                
                self.errorLogin.text = errorShow
                
            } else {
                self.errorLogin.text = ""
                self.showHomeScreen()
            }
            
        }
    }
    
    @IBAction func didClickRegisterButton(_ sender: Any) {
        let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didClickLoginwithGogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func didClickLoginWithFB(_ sender: Any) {
        LoginManager().logIn(permissions: [], from: self) { [weak self] (result, error) in
            guard let self = self else { return }
            
            if let error = error {
                self.errorLogin.text = error.localizedDescription
            }
            
            if let result = result, let token = result.token {
                let crediential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                self.signIn(crediential: crediential)
                
            }
        }
    }
}

//MARK: - GIDSignInDelegate
extension LoginViewController: GIDSignInDelegate {
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            errorLogin.text = error.localizedDescription
            return
        }
        
        guard let authentication = user.authentication else {
            errorLogin.text = error.localizedDescription
            return
        }
        
        let crediential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        self.signIn(crediential: crediential)
        
    }
    
    
}





