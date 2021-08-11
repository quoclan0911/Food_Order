//
//  OnboardingCollectionViewCell.swift
//  demoFood
//
//  Created by ASU on 7/5/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    static let identifier = "OnboardingCollectionViewCell"
    
    func setup(_ slide: OnboardingSilde) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
