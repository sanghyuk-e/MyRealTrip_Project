//
//  urlList.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180819//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import Foundation

enum baseURL{
    static let API = "http://myrealtrip-project.ap-northeast-2.elasticbeanstalk.com/api/"
    
    enum Products{
        static let product = baseURL.API + "products/"
        static let productList = baseURL.Products.product + "product_list/"
        static let productSearch = baseURL.Products.product + "product_search/"
        static let guides = baseURL.Products.productList + "guides/"
        static let activities = baseURL.Products.productList + "activities/"
        static let tickets = baseURL.Products.productList + "tickets/"
        static let snapshot = baseURL.Products.productList + "snapshot/"
        static let restaurants = baseURL.Products.productList + "restaurants/"
        static let convenience = baseURL.Products.productList + "convenience/"
    }
}


enum Country{
    static let japan = "Japan/"
    static let italy = "Italy/"
    static let spain = "Spain/"
    static let france = "France/"
    static let england = "England/"
    static let austria = "Austria/"
}

let guideURL = URL(string: baseURL.Products.guides)
let activitiesURL = URL(string: baseURL.Products.activities)
let ticketsURL = URL(string: baseURL.Products.tickets)
let snapshotURL = URL(string: baseURL.Products.snapshot)
let restaurantsURL = URL(string: baseURL.Products.restaurants)
let convenienceURL = URL(string: baseURL.Products.convenience)

let exampleURL = URL(string: baseURL.Products.productList + "Japan/Osaka/")
let exampleURL1 = URL(string: baseURL.Products.productList + "Italy/Roma/")
let exampleURL2 = URL(string: baseURL.Products.productList + "Japan/Sapporo/")
let exampleURL3 = URL(string: baseURL.Products.productList + "England/London/")
let exampleURL4 = URL(string: baseURL.Products.productList + "United+States+of+America/Las+Vegas/")

