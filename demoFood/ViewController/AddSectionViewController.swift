//
//  AddSectionViewController.swift
//  demoFood
//
//  Created by ASU on 5/24/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class AddSectionViewController: UIViewController {

    @IBOutlet weak var typeFoodTextField: UITextField!
    
    var newTypeFood: [FoodModel] = [FoodModel]()
    
    var didClickSaveButton: ((_ section: String, _ newtypeFood: [FoodModel]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didClickSaveButton(_ sender: Any) {
        
        if let section = typeFoodTextField.text {
            didClickSaveButton?(section, newTypeFood)
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
