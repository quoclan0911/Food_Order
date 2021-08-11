//
//  CategoryCollectionViewCell.swift
//  demoFood
//
//  Created by ASU on 7/6/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = "CategoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    func setup(category: Category) {
        categoryTitleLabel.text = category.name
        if let catetegoryImage = category.image, catetegoryImage != "", let url = URL(string: catetegoryImage) {
            categoryImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
//    private func getAvatar(urlString: String) {
//        ImageCache.cacheImage(userImageUrl: urlString) { [weak self] (avatar) in
//            guard let self = self else {
//                return
//            }
//            if let avatar = avatar {
//                DispatchQueue.main.async {
//                    self.categoryImageView.image = avatar
//                }
//            }
//        }
//    }

}
