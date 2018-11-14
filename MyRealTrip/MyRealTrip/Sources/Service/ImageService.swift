//
//  ImageService.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180809//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import Foundation

struct imageService {
    
    static func image (completion: ([Card]) -> Void) {
        
        let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json")
        let jsonData = try! Data(contentsOf: fileURL!)
        let decodedContent = try! JSONDecoder().decode([Card].self, from: jsonData)
        
        completion(decodedContent)
        
    }
    
    
}
