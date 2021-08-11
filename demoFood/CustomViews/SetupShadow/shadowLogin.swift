//
//  CardView.swift
//  demoFood
//
//  Created by ASU on 7/7/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class shadowLogin: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.cornerRadius = 27
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.2
    }
    
}
