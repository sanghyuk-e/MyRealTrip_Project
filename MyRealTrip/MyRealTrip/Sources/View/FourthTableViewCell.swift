//
//  FourthTableViewCell.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180810//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit
import Kingfisher

protocol PassDataProtocolDelegate: class {
    func presentToNewView(text: String)
}

class FourthTableViewCell: UITableViewCell {
    
    // Metric
    private struct Metric {
        static let numberOfItem: CGFloat = 2
        static let numberOfLine: CGFloat = 1
        
        static let topPadding: CGFloat = 5.0
        static let leftPadding: CGFloat = 10.0
        static let bottomPadding: CGFloat = 5.0
        static let rightPadding: CGFloat = 10.0
        
        static let lineSpacing: CGFloat = 10.0
        static let itemSpacing: CGFloat = 10.0
        
        static let nextOffset: CGFloat = 0.0
    }
    
    
    //Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var AccordingUrl = ""//
    
    weak var delegate: PassDataProtocolDelegate?
    
    var dataFromNetwork: [RawProduct] = []
    
//    var arr:[Card] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ FourthTableViewCell ] ----------\n")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        
//        imageService.image { (result) in
//            self.arr = result
//        }
        

        
        //통신
        networkService.requestAPI(url: guideURL!) { (response) in
            print(response)
            self.dataFromNetwork = response
            self.collectionView?.reloadData()
        }
        
        
    }
    


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}

extension FourthTableViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //dataFromNetwork의 category가 가이트 투어를 포함할때 그 item 들의 갯수를 반환하라.
        
        return dataFromNetwork.count
//        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
            
//            cell.thumbnail.image = UIImage(named: arr[indexPath.item].image)
//            cell.titleLabel.text = arr[indexPath.item].name
        
        cell.thumbnail.kf.setImage(with: URL(string: dataFromNetwork[indexPath.item].thumbnail))
        cell.categoryLabel.text = dataFromNetwork[indexPath.item].category
        cell.titleLabel.text = dataFromNetwork[indexPath.item].title
        cell.priceLabel.text = dataFromNetwork[indexPath.item].price
        
        
        return cell
    }
    
}

extension FourthTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        delegate?.presentToNewView(text: dataFromNetwork[indexPath.item].title)
        print("\n---------- [ delegate ] ----------\n")
//        print("delegate: ", delegate!)
        
        
        let deliverData: [String: Any] = [
            "title" : dataFromNetwork[indexPath.item].title,
            "thumbnail" : dataFromNetwork[indexPath.item].thumbnail
        ]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FourthTableViewCellData"), object: nil, userInfo: deliverData)
        
    }
}

extension FourthTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Metric.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Metric.itemSpacing
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsetsMake(Metric.topPadding, Metric.leftPadding, Metric.bottomPadding, Metric.rightPadding)
//    }
}






