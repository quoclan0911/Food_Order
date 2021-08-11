//
//  FoodModel.swift
//  demoFood
//
//  Created by ASU on 5/15/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class FoodModel: NSObject {

    var avatarFood: String?
    var nameFood: String?
    var quantityFood: String?
    var moneyFood: String?
    var information: String?
    var id: Int?
    
    
//    init(avatarFood: String, nameFood: String, quantityFood: String, moneyFood: String, information: String) {
//        self.avatarFood = avatarFood
//        self.nameFood = nameFood
//        self.quantityFood = quantityFood
//        self.moneyFood = moneyFood
//        self.information = information
//    }
    
    init(dictionary: [String: Any]) {
        if let id = dictionary["uid"] as? Int {
            self.id = id
        }
        if let avatar = dictionary["avatar"] as? String {
            self.avatarFood = avatar
        }
        if let name = dictionary["name"] as? String {
            self.nameFood = name
        }
        if let quantity = dictionary["quantity"] as? String {
            self.quantityFood = quantity
        }
        if let money = dictionary["money"] as? String {
            self.moneyFood = money
        }
        if let description = dictionary["description"] as? String {
            self.information = description
        }
    }

   static var listHeaderTitle = ["Cafe", "Trà sữa", "Thức uống", "Đồ ăn", "Cơm", "Nướng cay"]
}
