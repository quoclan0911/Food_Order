//
//  Dish.swift
//  demoFood
//
//  Created by ASU on 7/7/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import Foundation

struct FoodPopular {
    let id, name, description, price, image: String?
    
    var priceShow: String {
        return String(format: "$ " + price! + " đ")
    }
}

var populars: [FoodPopular] = [
    .init(id: "id1", name: "Banh xeo", description: "Banhx xeo lang chuon", price: "30.000d", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/cafesua.jpeg?alt=media&token=bf93a9f1-a9c2-4ab6-936f-67df55f576e6"),
    .init(id: "id1", name: "Banh xeo", description: "Banhx xeo lang chuon", price: "30.000d", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/cafesua.jpeg?alt=media&token=bf93a9f1-a9c2-4ab6-936f-67df55f576e6"),
    .init(id: "id1", name: "Banh xeo", description: "Banhx xeo lang chuon", price: "30.000d", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/cafesua.jpeg?alt=media&token=bf93a9f1-a9c2-4ab6-936f-67df55f576e6"),
    .init(id: "id1", name: "Banh xeo", description: "Banhx xeo lang chuon", price: "30.000d", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/cafesua.jpeg?alt=media&token=bf93a9f1-a9c2-4ab6-936f-67df55f576e6"),
    .init(id: "id1", name: "Banh xeo", description: "Banhx xeo lang chuon", price: "30.000d", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/cafesua.jpeg?alt=media&token=bf93a9f1-a9c2-4ab6-936f-67df55f576e6")
    
]
