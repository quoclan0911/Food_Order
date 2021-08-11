//
//  FoodSales.swift
//  demoFood
//
//  Created by ASU on 7/8/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import Foundation

struct FoodSales {
    let id, name, description, sales, image: String?
    
    var salesShow: String {
        return String(format: "Giam gia " + sales! + " %")
    }
}

var foodSales: [FoodSales] = [
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11"),
    .init(id: "id1", name: "12", description: "do an ngon", sales: "40", image: "https://firebasestorage.googleapis.com/v0/b/food-order-app-579c3.appspot.com/o/capuchino.jpeg?alt=media&token=a635b95b-219a-4ee1-bc8b-b1f3291d9d11")
]
