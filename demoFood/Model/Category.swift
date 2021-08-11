//
//  Dishcategory.swift
//  demoFood
//
//  Created by ASU on 7/6/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name: String?
    var image: String?
    var id: Int?
    
    init(name: String, image: String, id: Int) {
        self.name = name
        self.image = image
        self.id = id
    }
    
    init(dictionary: [String: Any]) {
        if let id = dictionary["uid"] as? Int {
            self.id = id
        }
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        if let image = dictionary["image"] as? String {
            self.image = image
        }
    }
    
    static var categories = [
        Category(name: "Tổng hợp", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20do%20nuong.jpeg?alt=media&token=de7d3234-277f-4ba2-9c5a-9ced0f3ae16b", id: 1),
        Category(name: "Cafe", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/cafe.jpeg?alt=media&token=a030a3e7-509e-43ee-a57e-dd7871277262", id: 2),
        Category(name: "Trà sữa", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20milk%20tea.jpeg?alt=media&token=9e233795-6bc9-425d-92e5-755b3cb99ae2", id: 3),
        Category(name: "Thức uống", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20drink%20dep.png?alt=media&token=b973670b-db8c-4821-9bb4-6467fe2be0d1", id: 4),
        Category(name: "Fast Food", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20fast%20food%20dep.png?alt=media&token=95e35f1a-add9-4aa4-95e0-d571be4d4636", id: 5),
        Category(name: "Cơm hộp", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20rice%20dep.jpeg?alt=media&token=20df4cb2-d296-4b27-bed3-dd67598cb18e", id: 6),
        Category(name: "Đồ nướng", image: "https://firebasestorage.googleapis.com/v0/b/fir-food-order.appspot.com/o/icon%20do%20nuong.jpeg?alt=media&token=de7d3234-277f-4ba2-9c5a-9ced0f3ae16b", id: 7)
    ]
}
