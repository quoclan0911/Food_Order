//
//  HomeViewController.swift
//  demoFood
//
//  Created by ASU on 7/6/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories = [Category]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        signOutButton()

    }
    
    private func register() {
        categoryCollectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(FoodPopularCollectionViewCell.nib(), forCellWithReuseIdentifier: FoodPopularCollectionViewCell.identifier)
        specialsCollectionView.register(FoodSalesCollectionViewCell.nib(), forCellWithReuseIdentifier: FoodSalesCollectionViewCell.identifier)
    }
        
    private func showLoginScreen() {
        if let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") {
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: false, completion: nil)
        }

    }
    
    
    private func signOutButton () {
        let signOutBarButton = UIBarButtonItem(title: "Đăng xuất" , style: .done, target: self, action: #selector(didClickLogOutButton))
        self.navigationItem.leftBarButtonItem = signOutBarButton
        
    }
    
    @objc func didClickLogOutButton () {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.setValue(false, forKey: "kIsLogin")
            showLoginScreen()
        } catch (let error as NSError) {
            print("\(error)")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return Category.categories.count
        case popularCollectionView:
            return populars.count
        default:
            return foodSales.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
             cell.setup(category: Category.categories[indexPath.row])
             return cell
        case popularCollectionView:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodPopularCollectionViewCell.identifier, for: indexPath) as! FoodPopularCollectionViewCell
             cell.setup(foodPopular: populars[indexPath.row])
             return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSalesCollectionViewCell.identifier, for: indexPath) as! FoodSalesCollectionViewCell
            cell.setup(food: foodSales[indexPath.row])
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
        let foodVC = storyboard?.instantiateViewController(identifier: "FoodViewController") as! FoodViewController
            foodVC.count = indexPath.row
        
        if indexPath.row == 0 {
            let allFoodVC = storyboard?.instantiateViewController(identifier: "AllFoodViewController") as! AllFoodViewController
            navigationController?.pushViewController(allFoodVC, animated: true)
        } else {
            navigationController?.pushViewController(foodVC, animated: true)
        }
        
        case popularCollectionView:
            let popular = populars[indexPath.row]
            let detailsVC = storyboard?.instantiateViewController(identifier: "AllFoodViewController") as! AllFoodViewController
            //detailsVC.popular = popular
            navigationController?.pushViewController(detailsVC, animated: true)

            
        default:
            UICollectionView()
        }
    }
}
