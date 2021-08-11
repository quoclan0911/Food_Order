//
//  FoodViewController.swift
//  demoFood
//
//  Created by ASU on 7/17/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit
import MBProgressHUD

class FoodViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var count: Int = -1

    var listFood = [FoodModel]()
    
    var cafeList = [FoodModel]()
    var cafeListRoot = [FoodModel]()
    
    var drinkList = [FoodModel]()
    var drinkListRoot = [FoodModel]()
    
    var fastFoodList = [FoodModel]()
    var fastFoodListRoot = [FoodModel]()
    
    var milkTeaList = [FoodModel]()
    
    var riceList = [FoodModel]()
    
    var meatList = [FoodModel]()

   
    
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        
        getCafe()
        getDrink()
        getFastFood()
        getMilkTea()
        getRice()
        getMeat()

        //        regissterObserver()
        
     
    }
    
    //    deinit {
    //        removeObserver()
    //    }
    
    private func register() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodTableViewCell.nib(), forCellReuseIdentifier: FoodTableViewCell.cellIdentifier)
        tableView.register(HeaderView.nib(), forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
    }
    
    private func getCafe() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getCafe { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.cafeList = foodList
                if self.count == 1 {
                    self.listFood = self.cafeList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func getFastFood() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getFastFood { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.fastFoodList = foodList
                if self.count == 4 {
                    self.listFood = self.fastFoodList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func getDrink() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getDrink { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.drinkList = foodList
                if self.count == 3 {
                    self.listFood = self.drinkList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func getMilkTea() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getMilkTea { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.milkTeaList = foodList
                if self.count == 2 {
                    self.listFood = self.milkTeaList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func getRice() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getRice { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.riceList = foodList
                if self.count == 5 {
                    self.listFood = self.riceList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func getMeat() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getMeat { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.meatList = foodList
                if self.count == 6 {
                    self.listFood = self.meatList
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    
    
}

//MARK: - UITableViewDataSource
extension FoodViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.cellIdentifier, for: indexPath) as! FoodTableViewCell
            let foodModel = listFood[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let addButton = UIButton(frame: CGRect(x: 358, y: 5, width: 40, height: 40))
        addButton.setImage(UIImage(named: "ic_plus3"), for: .normal)
        addButton.addTarget(self, action: #selector(didClickAddButton), for: .touchUpInside)

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as! HeaderView
    
        switch count {
        case 1:
            headerView.titleHeaderLabel.text = "Cafe"
        case 2:
            headerView.titleHeaderLabel.text = "Trà sữa"
        case 3:
            headerView.titleHeaderLabel.text = "Thức uống"
        case 4:
            headerView.titleHeaderLabel.text = "Fast food"
        case 5:
            headerView.titleHeaderLabel.text = "Cơm hộp"
        case 6:
            headerView.titleHeaderLabel.text = "Đồ nướng"
        default:
            headerView.titleHeaderLabel.text = "Tổng hợp"
        }
        headerView.addSubview(addButton)
        return headerView
    }
    @objc func didClickAddButton(addButton: UIButton) {
        let addFoodVC = storyboard?.instantiateViewController(identifier: "AddFoodViewController") as! AddFoodViewController
        addFoodVC.temp = count
        //        addFoodVC.delegate = self
        self.present(addFoodVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            let food = listFood[indexPath.row]
            let popup = UIAlertController(title: "Thông báo", message: "Bạn có chắc chắn muốn xoá \(food.nameFood!) hay không?", preferredStyle: .alert)

            let noAction = UIAlertAction(title: "Không", style: .cancel) { (action) in

            }

            let yesAction = UIAlertAction(title: "Có", style: .destructive) { (action) in
                if let index = self.cafeList.firstIndex(of: food) {
                    self.cafeList.remove(at: index)
                    tableView.deleteRows(at: [indexPath], with: .right)
                }
            }
            popup.addAction(noAction)
            popup.addAction(yesAction)
            self.present(popup, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDelegate
extension FoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let foodModel = listFood[indexPath.row]
        let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
        detailsFood.foodModel = foodModel
        detailsFood.temp = count
        self.navigationController?.pushViewController(detailsFood, animated: true)
        
    }
    
    
}
