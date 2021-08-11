//
//  DetailsFoodVC.swift
//  demoFood
//
//  Created by ASU on 5/21/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class DetailsFoodVC: UIViewController {
    
    @IBOutlet weak var avatarFoodImageView: UIImageView!
    
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var quantityFoodLabel: UILabel!
    @IBOutlet weak var moneyFoodLabel: UILabel!
    @IBOutlet weak var inforFoodLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    
    var temp: Int?
    var foodModel: FoodModel?
    var popular: FoodPopular?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow()
        display()

        
        let editBarButton = UIBarButtonItem(title: "Sửa", style: .done, target: self, action: #selector(didClickEditButton))
        self.navigationItem.rightBarButtonItem = editBarButton
    }
    
    //MARK: - Action
    @objc func didClickEditButton () {
        let editFoodVC = storyboard?.instantiateViewController(identifier: "EditFoodViewController") as! EditFoodViewController
        editFoodVC.food = foodModel
        editFoodVC.tempEdit = temp
        self.navigationController?.pushViewController(editFoodVC, animated: true)
        
    }
    
    //MARK: - Setup Shadow
    func shadow() {
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 10
        shadowView.layer.cornerRadius = 25
    }
    
    //MARK: - Display
    func display() {
        nameFoodLabel.text = foodModel?.nameFood
        quantityFoodLabel.text = foodModel?.quantityFood
        moneyFoodLabel.text = foodModel?.moneyFood
        inforFoodLabel.text = foodModel?.information
        
        if let avatar = foodModel?.avatarFood  {
            let url = URL(string: avatar )
            do {
                let data = try Data(contentsOf: url!)
                self.avatarFoodImageView.image = UIImage(data: data)
            } catch { print("Error") }
        } 
    }
    

    
}





