//
//  FoodDetailsCollectionViewCell.swift
//  demoFood
//
//  Created by ASU on 7/7/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class FoodPopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleFoodLabel: UILabel!
    @IBOutlet weak var imageFoodImageView: UIImageView!
    @IBOutlet weak var priceFoodLabel: UILabel!
    @IBOutlet weak var descriptionFoodLabel: UILabel!
    
    static let identifier = "FoodPopularCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FoodPopularCollectionViewCell", bundle: nil)
    }
    
    
    func setup(foodPopular: FoodPopular) {
        titleFoodLabel.text = foodPopular.name
        priceFoodLabel.text = foodPopular.priceShow
        descriptionFoodLabel.text = foodPopular.description
        if let imageFoodPopular = foodPopular.image, imageFoodPopular != "", let url = URL(string: imageFoodPopular) {
            imageFoodImageView.sd_setImage(with: url, completed: nil)
        }
        
    }
    
//    private func getAvatar(urlString: String) {
//        ImageCache.cacheImage(userImageUrl: urlString) { [weak self] (avatar) in
//            guard let self = self else {
//                return
//            }
//            if let avatar = avatar {
//                DispatchQueue.main.async {
//                    self.imageFoodImageView.image = avatar
//                }
//            }
//        }
//    }
}
