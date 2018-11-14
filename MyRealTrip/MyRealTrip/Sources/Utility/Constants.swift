//
//  Constants.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180815//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import Foundation


enum API {
    static let baseURL = "http://myrealtrip-project.ap-northeast-2.elasticbeanstalk.com/api/products/"

    enum Products {
        static let productList = API.baseURL + "product_list/"
        static let productSearch = API.baseURL + "product_search/"
    }

    enum ListCountries{ //나중에 고침
        static let Japan = API.Products.productList + "Japan/"
        static let Italy = API.Products.productList + "Italy/"
        static let Singapore = API.Products.productList + "Singapore/"
        static let France = API.Products.productList + "France/"
        static let England = API.Products.productList + "England/"
        static let Spain = API.Products.productList + "Spain/"

    }
    enum SearchCountries{
        static let Japan = API.Products.productSearch + "Japan/"
        static let Italy = API.Products.productSearch + "Italy/"
        static let Singapore = API.Products.productSearch + "Singapore/"
        static let France = API.Products.productSearch + "France/"
        static let England = API.Products.productSearch + "England/"
        static let Spain = API.Products.productSearch + "Spain/"
    }


}


//해당 URL
//let guideURL = URL(string: API.Products.productSearch + "%ED%88%AC%EC%96%B4/")!
//let ticketURL = URL(string: API.Products.productSearch + "%ED%8B%B0%EC%BC%93/")!
//let activityURL = URL(string: API.Products.productSearch + "%EC%95%A1%ED%8B%B0%EB%B9%84%ED%8B%B0/")!








