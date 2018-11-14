//
//  CardCollectionViewCell.swift
//  ProductPractice
//
//  Created by 변재우 on 20180813//.
//  Copyright © 2018 변재우. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tournameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    var heartButtonStateOff: Bool = true
    @IBOutlet weak var heartButton: UIButton!
    @IBAction func heartButton(_ sender: UIButton) {
        heartButtonStateOff = !heartButtonStateOff
        if (heartButtonStateOff == true) {
            heartButton.setImage(UIImage(named: "icons8-heart-outline-50"), for: .normal)
        }
        else {
            heartButton.setImage(UIImage(named: "icons8-heart-outline-48"), for: .normal)
//            NotificationCenter.default.post(<#T##notification: Notification##Notification#>)//
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ CardCollectionViewCell ] ----------\n")
        
//        self.contentView.backgroundColor = UIColor.black
        
        self.layer.allowsEdgeAntialiasing = true
        self.layer.shadowOpacity = 0.3
    }

}
