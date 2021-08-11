//
//  OnboardingViewController.swift
//  demoFood
//
//  Created by ASU on 7/4/21.
//  Copyright © 2021 DiepLan. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var slides: [OnboardingSilde] = [
        OnboardingSilde(title: "Ăn cả thế giới!" , description: "Thoã sức lựa chọn món ngon. Đừng ngại mà hại bao tử!", image: UIImage(named: "slide1")!),
        OnboardingSilde(title: "Tiết kiệm!", description: "Giá rẻ bất ngờ, chờ gì không mua. ", image: UIImage(named: "slide2")!),
        OnboardingSilde(title: "Giao hàng nhanh!", description: "Đặt hàng nhanh chóng, giao hàng tận nơi", image: UIImage(named: "slide3")!)
    ]
    
    var currentPage: Int = 0 {
        
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Bắt đầu", for: .normal)
            } else {
                nextButton.setTitle("Tiếp", for: .normal)
            }
        }
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Action
    @IBAction func didClickNextButton(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNavigation") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

//MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
