//
//  DetailsFoodViewController.swift
//  demoFood
//
//  Created by ASU on 5/20/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class DetailsFoodViewController: UIViewController {
    @IBOutlet weak var avatarLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var foodModel: FoodModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let foodViewController = storyboard?.instantiateViewController(identifier: FoodViewController.foodVCIdentifier) as! FoodViewController

        foodViewController.delagate = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let foodViewController = storyboard?.instantiateViewController(identifier: FoodViewController.foodVCIdentifier) as! FoodViewController
//         // b4: đăng kí
//          foodViewController.delagate = self
//    }

    @IBAction func didClickBackButton(_ sender:
        Any) {
        let foodViewController = storyboard?.instantiateViewController(identifier: FoodViewController.foodVCIdentifier) as! FoodViewController
        
        foodViewController.delagate = self
        
       // self.dismiss(animated: true, completion: nil)

    }
    
}
//b5: thiết lập hàm chính
extension DetailsFoodViewController: FoodVCDelegate {
   @objc func passingData(avatar AVATAR: String?, name NAME: String?, quantity QUANTITY: String?, money MONEY: String?, infor INFOR: String?) {
        avatarLabel.image = UIImage(named: AVATAR!)
        nameLabel.text = NAME
        quantityLabel.text = QUANTITY
        moneyLabel.text = MONEY
        informationLabel.text = INFOR
    }
    
    
}

//extension DetailsFoodViewController: FoodVCDelegate {
//        func passingData(foodModel: FoodModel) {
//        avatarLabel.image = UIImage(named: foodModel.avatarFood!)
//        nameLabel.text = foodModel.nameFood
//        quantityLabel.text = foodModel.quantityFood
//        moneyLabel.text = foodModel.moneyFood
//        informationLabel.text = foodModel.information
//
//    }
//}
