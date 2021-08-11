//
//  FirebaseUpdate.swift
//  demoFood
//
//  Created by ASU on 7/18/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class FirebaseUpdate: NSObject {
    
    static let shared = FirebaseUpdate()
    
    private override init() {
        super.init()
    }
    
    var ref = Database.database(url: "https://fir-food-order-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    var refStorage = Storage.storage().reference()
    
    func updateImage(image: UIImage, name: String, completion: @escaping ((URL?) -> ())) {
        guard let data = image.jpegData(compressionQuality: 0.3) else {
            return
        }
        let ref = refStorage.child("Avatar/\(name)")
        ref.putData(data, metadata: nil) { (metadata, error) in
            guard metadata != nil else {
                completion(nil)
                return
            }
            ref.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(nil)
                    return
                }
                completion(downloadURL)
                return
            }
        }
    }
    
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
    
}
