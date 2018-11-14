//
//  CardModel.swift
//  ProductPractice
//
//  Created by 변재우 on 20180813//.
//  Copyright © 2018 변재우. All rights reserved.


import Foundation


/*
 {
 "pk": 1,
 "city": {
 "pk": 1,
 "name": "Osaka"
 },
 "country": {
 "pk": 1,
 "name": "Japan"
 },
 "tour_name": "유투어버스",
 "thumbnail": "https://d2ur7st6jjikze.cloudfront.net/offer_photos/21886/204876_medium_1525760346.jpg?1525760346",
 "title": "[유투어버스]아라시야마+금각사+청수사+후시미이나리신사교토1일투어(Economy Class)",
 "review": "후기 266개",
 "price": "1인₩ 55,859",
 "category": "가이드 투어\n • \n이색 체험\n • \n시티투어",
 "meta_info": "10 시간"
 },
 */


//struct ProductList: Decodable {
//    let pk: Int
//    let city: Int
//    let country: Int
//    let tourName: String?
//    let thumbnail: String
//    let title: String
//    let review: String?
//    let price: String
//    let category: String?
//    let metaInfo: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case pk
//        case city
//        case country
//        case tourName = "tour_name"
//        case thumbnail
//        case title
//        case review
//        case price
//        case category
//        case metaInfo = "meta_info"
//
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        pk = try values.decode(Int.self, forKey: .pk)
//        city = try values.decode(Int.self, forKey: .city)
//        country = try values.decode(Int.self, forKey: .country)
//        tourName = try values.decode(String.self, forKey: .tourName)
//        thumbnail = try values.decode(String.self, forKey: .thumbnail)
//        title = try values.decode(String.self, forKey: .title)
//        review = try values.decodeIfPresent(String.self, forKey: .review)
//        price = try values.decode(String.self, forKey: .price)
//        category = try values.decodeIfPresent(String.self, forKey: .category)
//        metaInfo = try values.decodeIfPresent(String.self, forKey: .metaInfo)
//
//
//    }
//}



/*
{
    "pk": 838,
    "city": 3,
    "country": 2,
    "tour_name": "와이파이도시락",
    "thumbnail": "https://d2ur7st6jjikze.cloudfront.net/offer_photos/30328/194611_medium_1525772182.jpg?1525772182",
    "title": "★슈퍼특가★ 일본 와이파이도시락 포켓와이파이 ★100원★ + 해외로밍전화앱 60분 무료증정",
    "review": "후기 2172개",
    "price": "1인₩ 100",
    "category": "여행편의",
    "meta_info": ""
},
*/

/*
{
    "id": 1,
    "user": {
        "user_name": "Tester",
        "real_info": {
            "full_name":"Jon Doe"
        }
    },
    "reviews_count": [
    {
    "count": 4
    }
    ]
}
*/
