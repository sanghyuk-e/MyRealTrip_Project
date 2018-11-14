//
//  WishListViewController.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180818//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit
import Kingfisher

class WishListViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n---------- [ WishListViewController ] ----------\n")
        
        collectionView?.register(UINib(nibName: "WishlistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WishlistCollectionViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WishlistCollectionViewCell", for: indexPath) as! WishlistCollectionViewCell
//        cell.imageView
//        cell.titleLabel
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Tour", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "exampleViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


//FIXME: heartbutton???????????????
//extension WishListViewController: heartButtonProtocolDelegate {
//    func userClickedHeartButton(text: String, bool: Bool) {
//        print("\n---------- [ userclickedheartbutton ] ----------\n")
//        print(text, bool)
//
//    }
//}
