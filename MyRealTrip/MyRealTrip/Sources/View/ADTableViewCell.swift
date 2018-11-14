//
//  ThirdTableViewCell.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180804//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var header = UIView()
//    var titleLabel = UILabel()
    
    
    
    var loadedImage:[Card] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        imageService.image { (result) in
            self.loadedImage = result
        }
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
//        scrollView.frame = self.frame
        
        let pageColors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
        pageColors.forEach(addPageToScrollView(with: ))
        
//        pageControl.frame = CGRect(x: self.frame.midX - 20, y: self.frame.height - 10 , width: 40, height: 20)
        
        self.addSubview(pageControl)
        
    }

    private func addPageToScrollView(with color: UIColor) {
        let pageFrame = CGRect(origin: CGPoint(x: scrollView.contentSize.width, y: 0), size: scrollView.frame.size)
        
        
        let colorView = UIView(frame: pageFrame)
        colorView.backgroundColor = color.withAlphaComponent(0.6)
        scrollView.addSubview(colorView)
        
        scrollView.contentSize.width += self.frame.width
        pageControl.numberOfPages += 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}


extension ADTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


extension ADTableViewCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
}
