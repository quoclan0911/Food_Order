//
//  FoodSalesCollectionViewCell.swift
//  demoFood
//
//  Created by ASU on 7/8/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class FoodSalesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var salesLabel: UILabel!
    
    static let identifier = "FoodSalesCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FoodSalesCollectionViewCell", bundle: nil)
    }
    
    func setup(food: FoodSales) {
        nameLabel.text = food.name
        descriptionLabel.text = food.description
        salesLabel.text = food.salesShow
        if let foodSalesImage = food.image, foodSalesImage != "", let url = URL(string: foodSalesImage) {
            foodImageView.sd_setImage(with: url, completed: nil)
        }
        
    }
    
//    private func getAvatar(urlString: String) {
//        ImageCache.cacheImage(userImageUrl: urlString) { [weak self] (avatar) in
//            guard let self = self else {
//                return
//            }
//            if let avatar = avatar {
//                DispatchQueue.main.async {
//                    self.foodImageView.image = avatar
//                }
//            }
//        }
//    }
    


}
