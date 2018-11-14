//
//  exampleViewController.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180809//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit
import Kingfisher
import ParallaxHeader

class exampleViewController: UIViewController {
  
    var city: String = ""
    var country: String = ""
    var tourname: String = ""
    var thumbnail: String = ""
    var titleS: String = ""
    var review: String = ""
    var price: String = ""
    var category: String = ""
    var metainfo: String = ""
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var guidetourLabel: UILabel!
    @IBOutlet weak var meetingtimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var reservationButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n---------- [ exampleViewController ] ----------\n")
  
        NotificationCenter.default.addObserver(self, selector: #selector(deliveredData(noti:)), name: NSNotification.Name(rawValue: "FourthTableViewCellData"), object: nil)
        
//        self.nameLabel.text = noti.userInfo!["title"] as? String
//        self.imageView.kf.setImage(with: URL(string: noti.userInfo!["thumbnail"] as! String))
        
//        self.imageView.kf.setImage(with: URL(string: thumbnail!))
        self.titleLabel.text = titleS
//        self.cityCountryLabel.text = city + country
//        self.priceLabel = price
//        self.textView.text = ?
//        self.reviewLabel.text = review
        
        
        
        setupParallaxHeader()
        
    }
    
    
    @objc func deliveredData(noti: Notification) {
        print("UserInfo: ", noti)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func setupParallaxHeader() {
        imageView.image = UIImage(named: "Grand Canyon")
        imageView.contentMode = .scaleAspectFill
        
        scrollView.parallaxHeader.view = imageView
        scrollView.parallaxHeader.height = 200
        scrollView.parallaxHeader.minimumHeight = 0
        scrollView.parallaxHeader.mode = .topFill
//        scrollView.parallaxHeader.parallaxHeaderDidScrollHandler = { ParallaxHeader in
//            print(ParallaxHeader.progress)
//        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension exampleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        return cell
    }

    
    
}

extension exampleViewController: UICollectionViewDelegate{
    
}

extension exampleViewController: UICollectionViewDelegateFlowLayout {
    
}
