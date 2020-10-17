//
//  HomePageViewController.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/16/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit
import FSPagerView
import NVActivityIndicatorView

class HomePageViewController: BaseViewController {
    
    //MARK:- Outlets

    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
            self.pagerView.automaticSlidingInterval = .init(3)
            self.pagerView.layer.cornerRadius = 10
            self.pagerView.clipsToBounds = true
            
        }
    }
    
    @IBOutlet weak var pagerController: FSPageControl!{
        didSet {
            self.pagerController.numberOfPages = self.retreviedData.data.slider.count
            self.pagerController.contentHorizontalAlignment = .right
            self.pagerController.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pagerController.backgroundColor = .clear
            self.pagerController.setFillColor(#colorLiteral(red: 0, green: 0.8260638118, blue: 0.5592608452, alpha: 0.8470588235), for: .selected)
            self.pagerController.setFillColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            self.pagerController.contentHorizontalAlignment = .center
            
        }
    }
    @IBOutlet weak var newOffersCollectionView: UICollectionView!
    @IBOutlet weak var allCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    @IBOutlet weak var bestSellingCollectionView: UICollectionView!
    
    @IBOutlet weak var loadingIndicatorView: NVActivityIndicatorView!
    //MARK:- Properities
    
    fileprivate let newOffersCell = "NewOffersCell"
    fileprivate let allCategoriesCell = "AllCategoriesCell"
    fileprivate let brandsCell = "BrandsCell"
    fileprivate let bestSellingCell = "BestSellingCell"
    var homePagePresenter: HomePagePresenter?
    var retreviedData = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePagePresenter = HomePagePresenter(homeVC: self)
        homePagePresenter?.homeData.delegate = self
        setupCollectionviews()
        getData()
        
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionviews(){
        newOffersCollectionView.delegate = self
        newOffersCollectionView.dataSource = self
        newOffersCollectionView.register(UINib(nibName: newOffersCell, bundle: nil), forCellWithReuseIdentifier: newOffersCell)
        
        allCategoriesCollectionView.delegate = self
        allCategoriesCollectionView.dataSource = self
        allCategoriesCollectionView.register(UINib(nibName: allCategoriesCell, bundle: nil), forCellWithReuseIdentifier: allCategoriesCell)
        
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        brandsCollectionView.register(UINib(nibName: brandsCell, bundle: nil), forCellWithReuseIdentifier: brandsCell)
        
        bestSellingCollectionView.delegate = self
        bestSellingCollectionView.dataSource = self
        bestSellingCollectionView.register(UINib(nibName: bestSellingCell, bundle: nil), forCellWithReuseIdentifier: bestSellingCell)
        pagerView.delegate = self
        pagerView.dataSource = self
        loadingIndicatorView.type = .ballScaleMultiple
    
    }
    
    func getData(){
        loadingIndicatorView.startAnimating()
        homePagePresenter?.homeData.getHomeData(success: { (success) in
            self.retreviedData = (self.homePagePresenter?.homeData)!
            self.loadingIndicatorView.stopAnimating()
            self.newOffersCollectionView.reloadData()
            self.allCategoriesCollectionView.reloadData()
            self.brandsCollectionView.reloadData()
            self.bestSellingCollectionView.reloadData()
            self.pagerView.reloadData()
            self.pagerController.numberOfPages = self.retreviedData.data.slider.count
        }, failure: { (failure) in
            print(failure!.localizedDescription)
        })
    }
    
    @IBAction func sideMenuBtn(_ sender: UIButton) {
    }
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1000{
            return retreviedData.data.landingPages.count
        }else if collectionView.tag == 1001{
            return retreviedData.data.subCategories.count
        }else if collectionView.tag == 1002{
            return retreviedData.data.brands.count
        }else{
            return retreviedData.data.bestselling.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1000{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newOffersCell, for: indexPath) as! NewOffersCell
            cell.setupOffer(page: retreviedData.data.landingPages[indexPath.row])
            return cell
        }else if collectionView.tag == 1001{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allCategoriesCell, for: indexPath) as! AllCategoriesCell
            cell.setupCat(cat: retreviedData.data.subCategories[indexPath.row])
            return cell
        }else if collectionView.tag == 1002{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brandsCell, for: indexPath) as! BrandsCell
            cell.setupBrand(brand: retreviedData.data.brands[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bestSellingCell, for: indexPath) as! BestSellingCell
            cell.setupSelling(sell: retreviedData.data.bestselling[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1000{
            return CGSize(width: 160, height: 100)
        }else if collectionView.tag == 1001{
            return CGSize(width: 80, height: 120)
        }else if collectionView.tag == 1002{
            return CGSize(width: 80, height: 80)
        }else{
            return CGSize(width: 160, height: 220)
        }
    }
    
    
}


extension HomePageViewController: FSPagerViewDataSource,FSPagerViewDelegate{
    // MARK:- FSPagerView DataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.retreviedData.data.slider.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        SetImageWithPlaceholder.setImage(Constant.mainDomain + retreviedData.data.slider[index].image, placeholder: "images", myImage: cell.imageView ?? UIImageView())
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = ""
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pagerController.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pagerController.currentPage = pagerView.currentIndex
    }
    
}
