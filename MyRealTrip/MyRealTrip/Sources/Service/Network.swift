//
//  Network.swift
//  ProductPractice
//
//  Created by 변재우 on 20180813//.
//  Copyright © 2018 변재우. All rights reserved.
//

import Foundation
import Alamofire



struct networkService {
    static func requestAPI (url: URL, completion: @escaping ([RawProduct]) -> Void) {
        
        Alamofire.request(url, method: .get, parameters: nil)
        .validate()
        .responseData { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let decodedContent = try JSONDecoder().decode([RawProduct].self, from: value)
                    
                    completion(decodedContent)
                } catch {
                    print("errorlkjlkjlk")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}


