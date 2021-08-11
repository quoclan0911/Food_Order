//
//  HeaderView.swift
//  demoFood
//
//  Created by ASU on 5/22/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleHeaderLabel: UILabel!
    
    static let identifier = "HeaderView"
    
    @IBAction func didClickAddButton(_ sender: Any) {
        
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "HeaderView", bundle: nil)
    }
    

}


