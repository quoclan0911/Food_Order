//
//  GetAvatar.swift
//  demoFood
//
//  Created by ASU on 7/1/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//


import UIKit
import Foundation

class ImageCache {

    static func cacheImage(userImageUrl: String, completion: @escaping (_ image: UIImage?)->Void ) {
        let fileManager = FileManager.default
        let diskPaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)

        let cacheDirectory = diskPaths[0] as NSString
        let diskPath = cacheDirectory.appendingPathComponent("\(userImageUrl.hashValue)")

        if let userImageData = ImageCacheHelper.getObjectForKey(imageKey: "\(userImageUrl.hashValue)"),
           let img = UIImage(data: userImageData as Data) {
            print("found in memory cached")
            completion(img)
            return
        }

        if fileManager.fileExists(atPath: diskPath) {
            //userImgView.image = image
            if let image = UIImage(contentsOfFile: diskPath),
               let compressedData = image.jpegData(compressionQuality: 0.5) {
                // add to memory cache
                ImageCacheHelper.setObjectForKey(data: NSData(data: compressedData), imageKey: NSString(string: "\(userImageUrl.hashValue)"))
                print("found in disk cached")
                completion(image)
                return
            }
        }

        // get image from url and write to disk
        ImageCacheHelper.getImage(imageUrl: userImageUrl) { imageData in
            guard let imageData = imageData else {
                completion(nil)
                return
            }
            print("add to disk cache")
            imageData.write(toFile: diskPath, atomically: true)

            let data = imageData as Data
            if let userImage = UIImage(data: data) {

                completion(userImage)
            }
        }
    }
}

class ImageCacheHelper: NSObject {
    static var cache = NSCache<NSString, NSData>()
    static var isNotRunningDispatch: Bool = true

    class func setObjectForKey(data: NSData, imageKey: NSString) {
        ImageCacheHelper.cache.setObject(data, forKey: imageKey)
    }

    class func getObjectForKey(imageKey: String)-> NSData? {
        let imageData = ImageCacheHelper.cache.object(forKey: NSString(string: imageKey))
        return imageData
    }

    class func getImage(imageUrl: String,
                        completionHandler: @escaping (NSData?)->()) {

        if ImageCacheHelper.isNotRunningDispatch {
            ImageCacheHelper.isNotRunningDispatch = false

            DispatchQueue.global().async {
                if let imgUrl = URL(string: imageUrl),
                   let imageData = NSData(contentsOf: imgUrl) {
                    print("add to memory cache")

                    let key = NSString(string: "\(imageUrl.hashValue)")
                    ImageCacheHelper.setObjectForKey(data: imageData, imageKey: key)
                    ImageCacheHelper.isNotRunningDispatch = true
                    completionHandler(imageData)
                    return
                }

                completionHandler(nil)
            }
        } else {
            print("started loading image")
            completionHandler(nil)
        }
    }
}


//class GetAvatar: NSObject {
//
//    static let shared = GetAvatar()
//
//    var imageCache = NSCache<NSString, UIImage>()
//
//    func getAvatar(urlString: String, completion: @escaping (UIImage?) -> ()) {
//
//        guard let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//
//        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
//            completion(cachedImage)
//        } else {
//            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 3)
//            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//
//                if error != nil {
//                    completion(nil)
//                }
//
//                guard let data = data, let image = UIImage(data: data) else {
//                    completion(nil)
//                    return
//                }
//                self?.imageCache.setObject(image, forKey: url.absoluteString as NSString)
//
//                DispatchQueue.main.async {
//                    completion(image)
//                }
//            }
//            task.resume()
//        }
//    }
//
//
//}

