//
//  TourTicketTableViewController.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180822//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//
import UIKit

class TourTicketTableViewController: UITableViewController {
    
    @IBAction private func searchButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Tour", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchBarViewController")
        present(vc, animated: true, completion: nil)
    }
    
    
    private let kTableHeaderHeight: CGFloat = 200.0
    var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Stretchy HeaderView (Image)
        tableView.rowHeight = UITableViewAutomaticDimension
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        
        
        tableView.register(UINib(nibName: "TravelDestinationTableViewCell", bundle: nil), forCellReuseIdentifier: "TravelDestinationTableViewCell")
        tableView.register(UINib(nibName: "ADTableViewCell", bundle: nil), forCellReuseIdentifier: "ADTableViewCell")
        tableView.register(UINib(nibName: "FourthTableViewCell", bundle: nil), forCellReuseIdentifier: "FourthTableViewCell")
        
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y <= -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden: Bool  {return true}
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelDestinationTableViewCell", for: indexPath) as! TravelDestinationTableViewCell
            cell.titleLabel.text = titleList[0]
            cell.delegate = self
            
            return cell
            
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[1]
            //guidesURL
            networkService.requestAPI(url: guideURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            return cell
        }
            
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[2]
            //ticketsURL
            networkService.requestAPI(url: ticketsURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[3]
            //activitiesURL
            networkService.requestAPI(url: activitiesURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            
            return cell
        }
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[4]
            //snapshotURL
            networkService.requestAPI(url: snapshotURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            return cell
        }
        else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[5]
            //restaurantsURL
            networkService.requestAPI(url: restaurantsURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell", for: indexPath) as! FourthTableViewCell
            cell.titleLabel.text = titleList[6]
            //ConvenienceURL
            networkService.requestAPI(url: convenienceURL!) { (result) in
                cell.dataFromNetwork = result
                cell.collectionView?.reloadData()
            }
            cell.delegate = self
            return cell
        }
        
        
    }
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if indexPath.row == 1 {
    //            print("2")
    //        }
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1{
            return 300
        } else {
            return 300        }
    }
    
}

extension TourTicketTableViewController: CustomProtocol {
    func pushToNewView(text: String) {
        
        print("sumtext: ", text)
        
        let storyboard = UIStoryboard(name: "Tour", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TourCollectionViewController") as! TourCollectionViewController
        vc.accordingURL = text
        //        self.present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension TourTicketTableViewController: PassDataProtocolDelegate {
    
    func presentToNewView(text: String) {
        print(text)
        let storyboard = UIStoryboard(name: "Tour", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "exampleViewController") as! exampleViewController
        //        vc.city =
        //        vc.country =
        //        vc.tourname =
        //        vc.thumbnail =
        vc.titleS = text
        //        vc.review =
        //        vc.price =
        //        vc.category =
        //        vc.metainfo =
        
        //        self.present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        print("end presentToNewView")
    }
}

