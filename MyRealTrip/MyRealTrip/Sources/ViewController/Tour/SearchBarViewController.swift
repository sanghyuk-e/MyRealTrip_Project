//
//  SearchBarViewController.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180817//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    @IBAction private func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
