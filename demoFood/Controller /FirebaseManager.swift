//
//  FirebaseManager.swift
//  demoFood
//
//  Created by ASU on 7/16/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirebaseManager: NSObject {
    
    static let shared = FirebaseManager() // duy nhat bien singleton
    
    private override init() {
        super.init()
    }
    
    var ref = Database.database(url: "https://fir-food-order-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    func getCafe(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("Cafe").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var listCafe = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        listCafe.append(foodModel)
                    }
                }
                completion(listCafe, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    
    func getDrink(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("Drink").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var listDrink = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        listDrink.append(foodModel)
                    }
                }
                completion(listDrink, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    
    func getFastFood(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("FastFood").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var fastFoodList = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        fastFoodList.append(foodModel)
                    }
                }
                completion(fastFoodList, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    
    func getMilkTea(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("MilkTea").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var fastFoodList = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        fastFoodList.append(foodModel)
                    }
                }
                completion(fastFoodList, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    
    func getMeat(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("Meat").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var fastFoodList = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        fastFoodList.append(foodModel)
                    }
                }
                completion(fastFoodList, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    
    func getRice(completion: @escaping ([FoodModel]?, Error?) -> () ) {
        ref.child("Rice").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                var fastFoodList = [FoodModel]()
                dict.keys.forEach { (key) in
                    if let dictFood = dict[key] as? [String: Any] {
                        let foodModel = FoodModel(dictionary: dictFood)
                        fastFoodList.append(foodModel)
                    }
                }
                completion(fastFoodList, nil)
            }
        }) { (error) in
            completion(nil, error)
        }
    }
    


    
}
