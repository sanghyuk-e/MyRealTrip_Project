//
//  SecondTableViewCell.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180802//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit
import Kingfisher

protocol CustomProtocol: class {
    func pushToNewView(text: String)
}

class TravelDestinationTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var accordingURL: String = ""
    
    
    weak var delegate: CustomProtocol?


    var arr:[Card] = []
//    var dataOfContries:[ProductList] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstCollectionViewCell")
        
//        Mark: ImageService (데이터 불러오기)
        imageService.image { (result) in
            self.arr = result
            self.collectionView?.reloadData()
        }
        
        //Products
//        let url = URL(string: API.Products.productSearch + "%ED%88%AC%EC%96%B4/")!
//
//        networkService.requestAPI(url: url) { (response) in
//            self.dataOfContries = response
//            self.collectionView?.reloadData()
//        }
    }
    
    
}


extension TravelDestinationTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataOfContries.count
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
        
//        cell.countryLabel.text = String(dataOfContries[indexPath.item].city)
//        cell.thumbnail.kf.setImage(with: URL(string: dataOfContries[indexPath.item].thumbnail))
        
        cell.countryLabel.text = String(arr[indexPath.item].name)
        cell.thumbnail.image = UIImage(named: arr[indexPath.item].image)
        
        
        return cell
        
    }
    
    
}

extension TravelDestinationTableViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //delegate 로 다음 뷰컨트롤러로 넘어감
        //FIXME: 임시방편
        let countryArray = ["Spain/", "Budapest/", "/China", "England/", "Japan/", "France/", "Italy/", "Singapore/", "Taiwan%2C+Province+of+China/" ]
        let sumtext = countryArray[indexPath.item] + arr[indexPath.item].name
        
//        let accordingCountryURL = [
//            
//        ]

//        delegate?.pushToNewView(text: "\(arr[indexPath.item].name)" )//
        delegate?.pushToNewView(text: sumtext )//
        print("\n---------- [ delegate ] ----------\n")
            print("delegate: ", delegate!)
        
        //다음 viewController로 넘길 데이터를 딕셔너리 형태로 선언, userInfo 에 넣어서 넘긴다
        let deliverData: [String: Any] = [
            //
            "title" : arr[indexPath.item].name,
            
//            "image" : dataOfContries[indexPath.item].thumbnail
        ]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PassDataFromTD"), object: nil, userInfo: deliverData)

    }
}

extension TravelDestinationTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
}


