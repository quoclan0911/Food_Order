//
//  ViewController.swift
//  demoFood
//
//  Created by ASU on 5/15/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func didClickLoginButton(_ sender: Any) {
        let foodViewController = storyboard?.instantiateViewController(identifier: "FoodViewController")
        self.navigationController?.pushViewController(foodViewController!, animated: true)
    }

    
}

