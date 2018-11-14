//
//  FirstCollectionViewCell.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180802//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ FirstCollectionViewCell ] ----------\n")
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.23
        self.layer.shadowRadius = 4
        self.layer.borderWidth = 0.2
        
    }

}
