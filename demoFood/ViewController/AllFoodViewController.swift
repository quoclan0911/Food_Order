
import UIKit
import MBProgressHUD


class AllFoodViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countRowEdit: Int = -1
    var countSectionEdit: Int = -1
    
    var counRowAdd: Int = -1
    var countSectionAdd: Int = -1
    
    static let shared = AllFoodViewController()
    
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

        
//        regissterObserver()
        
        getCafe()
        getDrink()
        getFastFood()
        getMilkTea()
        getMeat()
        getRice()
    }
    
//    deinit {
//        removeObserver()
//    }
    
    private func register() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AllFoodTalbeViewCell.nib(), forCellReuseIdentifier: AllFoodTalbeViewCell.cellIdentifier)
        
        tableView.register(HeaderView.nib(), forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        
        
    }
    
    private func getCafe() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FirebaseManager.shared.getCafe { [weak self] (foodList, error) in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            if let foodList = foodList {
                self.cafeList = foodList
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
                   DispatchQueue.main.async {
                       self.tableView.reloadData()
                   }
               }
           }
       }
       
}

//MARK: - UITableViewDataSource
extension AllFoodViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FoodModel.listHeaderTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cafeList.count
        case 1:
            return milkTeaList.count
        case 2:
            return drinkList.count
        case 3:
            return fastFoodList.count
        case 4:
            return riceList.count
        default:
            return meatList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = cafeList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = milkTeaList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = drinkList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = fastFoodList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = riceList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllFoodTalbeViewCell.cellIdentifier, for: indexPath) as! AllFoodTalbeViewCell
            let foodModel = meatList[indexPath.row]
            cell.setup(foodModel: foodModel, indexPath: indexPath)
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let addButton = UIButton(frame: CGRect(x: 358, y: 5, width: 40, height: 40))
        addButton.setImage(UIImage(named: "ic_plus3"), for: .normal)
        addButton.addTarget(self, action: #selector(didClickAddButton), for: .touchUpInside)
        addButton.tag = section
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as! HeaderView
        headerView.titleHeaderLabel.text = FoodModel.listHeaderTitle[section]
        
        headerView.addSubview(addButton)
        return headerView
    }
        
    @objc func didClickAddButton(addButton: UIButton) {
        let addFoodVC = storyboard?.instantiateViewController(identifier: "AddFoodViewController") as! AddFoodViewController
        countSectionAdd = addButton.tag
        
        addFoodVC.temp = countSectionAdd + 1

//        addFoodVC.delegate = self
        self.present(addFoodVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        switch indexPath.section {
        case 0:
            let food = cafeList[indexPath.row]
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

        case 1:
            let food = drinkList[indexPath.row]
            let popup = UIAlertController(title: "Thông báo", message: "Bạn có chắc chắn muốn xoá \(food.nameFood!) hay không?", preferredStyle: .alert)

            let noAction = UIAlertAction(title: "Không", style: .cancel) { (action) in

            }

            let yesAction = UIAlertAction(title: "Có", style: .destructive) { (action) in
                if let index = self.drinkList.firstIndex(of: food) {
                    self.drinkList.remove(at: index)
                    tableView.deleteRows(at: [indexPath], with: .right)
                }
            }
            popup.addAction(noAction)
            popup.addAction(yesAction)
            self.present(popup, animated: true, completion: nil)

        default:
            let food = fastFoodList[indexPath.row]
            let popup = UIAlertController(title: "Thông báo", message: "Bạn có chắc chắn muốn xoá \(food.nameFood!) hay không?", preferredStyle: .alert)

            let noAction = UIAlertAction(title: "Không", style: .cancel) { (action) in
            }

            let yesAction = UIAlertAction(title: "Có", style: .destructive) { (action) in
                if let index = self.fastFoodList.firstIndex(of: food) {
                    self.fastFoodList.remove(at: index)
                    tableView.deleteRows(at: [indexPath], with: .right)
                }
            }
            popup.addAction(noAction)
            popup.addAction(yesAction)
            self.present(popup, animated: true, completion: nil)
        }
    }
    
}

//MARK: - UITableViewDelegate
extension AllFoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        countRowEdit = indexPath.row
        countSectionEdit = indexPath.section

        switch indexPath.section {

        case 0:
            let foodModel = cafeList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)

        case 1:
            let foodModel = milkTeaList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)
        
        case 2:
            let foodModel = drinkList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)
            
        case 3:
            let foodModel = fastFoodList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)
            
        case 4:
            let foodModel = riceList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)

        default:
            let foodModel = meatList[indexPath.row]
            let detailsFood = storyboard?.instantiateViewController(withIdentifier: "DetailsFoodVC") as! DetailsFoodVC
            detailsFood.foodModel = foodModel
            self.navigationController?.pushViewController(detailsFood, animated: true)

        }
    }

}

////MARK: - Delegate (Add)
//extension FoodViewController: AddFoodDelegate {
//    func passingData(foodModel: FoodModel) {
//
//        switch countSectionAdd {
//        case 0:
//            FoodModel.listCafe.append(foodModel)
//        case 1:
//            FoodModel.listDrinks.append(foodModel)
//        default:
//            FoodModel.listFastFood.append(foodModel)
//        }
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//}
//
////MARK: - Notification (Edit)
//extension FoodViewController {
//
//    func regissterObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didEditData(data:)), name: NSNotification.Name("passingData"), object: nil)
//    }
//
//    @objc func didEditData(data: Notification) {
//        let foodModel = data.object as! FoodModel
//
//        switch countSectionEdit {
//        case 0:
//            FoodModel.listCafe[countRowEdit] = foodModel
//        case 1:
//            FoodModel.listDrinks[countRowEdit] = foodModel
//        default:
//            FoodModel.listFastFood[countRowEdit] = foodModel
//        }
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//
//    func removeObserver() {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//}
//
//
//
