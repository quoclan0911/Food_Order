//
//  FoodTableViewCell.swift
//  demoFood
//
//  Created by ASU on 5/18/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import SDWebImage
class AllFoodTalbeViewCell: UITableViewCell {
    
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var quantityFoodLabel: UILabel!
    @IBOutlet weak var monneyFoodLabel: UILabel!
    @IBOutlet weak var avatarFoodImageView: UIImageView!
    
    var indexPath: IndexPath!
    
    static let cellIdentifier = "AllFoodTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AllFoodTableViewCell", bundle: nil)
    }
    
    
    func setup(foodModel: FoodModel, indexPath: IndexPath) {
        self.indexPath = indexPath
    
        nameFoodLabel.text = foodModel.nameFood
        quantityFoodLabel.text = foodModel.quantityFood
        monneyFoodLabel.text = foodModel.moneyFood
        
        if let avatar = foodModel.avatarFood, avatar != "", let url = URL(string: avatar) {
            avatarFoodImageView.sd_setImage(with: url, completed: nil)
    }
}

//private func getAvatar(urlString: String, indexPath: IndexPath) {
//    ImageCache.cacheImage(userImageUrl: urlString) { [weak self] (avatar) in
//        guard let self = self else {
//            return
//        }
//        if let avatar = avatar, self.indexPath.row == indexPath.row {
//            DispatchQueue.main.async {
//                self.avatarFoodImageView.image = avatar
//            }
//        }
//    }
//}


}
