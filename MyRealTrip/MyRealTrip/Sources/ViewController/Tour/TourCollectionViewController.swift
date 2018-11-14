//
//  TourCollectionViewController.swift
//  ProductPractice
//
//  Created by 변재우 on 20180813//.
//  Copyright © 2018 변재우. All rights reserved.
//

import UIKit
import Kingfisher


class TourCollectionViewController: UICollectionViewController {
    
    
    var accordingURL: String = ""
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var modelArray: [RawProduct] = []
//    var imageArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n---------- [ TourCollectionView ] ----------\n")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        NotificationCenter.default.addObserver(self, selector: #selector(deliveredData(noti:)), name: NSNotification.Name(rawValue: "PassDataFromTD"), object: nil)
        
        
        print(accordingURL)
        // Register cell classes
        self.collectionView?.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        

//        networkService.requestAPI { (response) in
//            print(response)
//            self.modelArray = response
//            self.collectionView?.reloadData()
//        }
        
        //여기 전 VC 에서 데이터(인기여행지(이름))를 가져와서 url 화 한다음에 집어넣어준다.
//        let url = URL(string: "http://myrealtrip-project.ap-northeast-2.elasticbeanstalk.com/api/products/product_list/Japan/Osaka")!
        
        let url = URL(string: baseURL.Products.productList + accordingURL)!
        
        networkService.requestAPI(url: url) { (response) in
            self.modelArray = response
            self.collectionView?.reloadData()
        }

    }
    
    @objc func deliveredData(noti: Notification) {
        print("UserInfo: ", noti)
        //FIXME: title -> url
        self.accordingURL = (noti.userInfo!["title"] as? String)!
        print("accordingURL:", accordingURL)
        self.title = noti.userInfo!["title"] as? String

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return modelArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        cell.thumbnailImage.kf.setImage(with: URL(string: modelArray[indexPath.item].thumbnail))
        cell.categoryLabel.text = modelArray[indexPath.item].category
        cell.titleLabel.text = modelArray[indexPath.item].title
        cell.tournameLabel.text = modelArray[indexPath.item].tourName
        cell.reviewLabel.text = modelArray[indexPath.item].review
        cell.priceLabel.text = modelArray[indexPath.item].price
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        //FIXME:
        
        let storyboard = UIStoryboard(name: "Tour", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "exampleViewController") as! exampleViewController
        
        
        navigationController?.pushViewController(vc, animated: true)
        
        return true
    }
        //
//        prepare(for: UIStoryboardSegue(identifier: "toExampleSegue", source: UIViewController(nibName: "TourCollectionViewController", bundle: nil), destination: UIViewController(nibName: "exampleViewControlelr", bundle: nil)), sender: Any?) {
//            if
//        }

 

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}



extension TourCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
}

