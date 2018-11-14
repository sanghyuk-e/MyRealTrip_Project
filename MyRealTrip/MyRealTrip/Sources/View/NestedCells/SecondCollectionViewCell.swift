//
//  SecondCollectionViewCell.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180816//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit

//protocol heartButtonProtocolDelegate: class {
//    func userClickedHeartButton(text: String, bool: Bool)
//}//??????

class SecondCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
//    var delegate: heartButtonProtocolDelegate? //??????
    
    var heartButtonStateOff: Bool = true
    @IBOutlet private weak var heartButton: UIButton!
    @IBAction private func heartButton(_ sender: Any) {
        heartButtonStateOff = !heartButtonStateOff
        if (heartButtonStateOff == true) {
            heartButton.setImage(UIImage(named: "icons8-heart-outline-50"), for: .normal)
        }
        else {
            heartButton.setImage(UIImage(named: "icons8-heart-outline-48"), for: .normal)
//            if self.heartButton.isSelected {
//                self.delegate?.userClickedHeartButton(text: "UserClickedHeartButton", bool: true)
//
//            }
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ SecondCollectionViewCell ] ----------\n")
        
        self.addConstraint(NSLayoutConstraint(item: heartButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: heartButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0))
        
        
    }

}
