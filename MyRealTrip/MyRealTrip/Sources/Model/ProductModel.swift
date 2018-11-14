//
//  ProductModel.swift
//  MyRealTrip
//
//  Created by 변재우 on 20180822//.
//  Copyright © 2018 sanghyuk. All rights reserved.
//

import Foundation


struct RawProduct: Decodable {
    let pk: Int
    let city: City
    let country: Country
    let tourName: String
    let thumbnail: String
    let title: String
    let review: String
    let price: String
    let category: String
    let metaInfo: String
    
    enum CodingKeys: String, CodingKey {
        case pk, city, country, thumbnail, title, review, price, category
        case tourName = "tour_name"
        case metaInfo = "meta_info"
    }
    
    struct City: Decodable {
        let pk: Int
        let name: String
    }
    
    struct Country: Decodable {
        let pk: Int
        let name: String
    }



}

//    struct CityName: Decodable {
//        let pk: Int
//        let name: String
//
//        enum CityKeys: String, CodingKey {
//            case pk, name
//        }
//
//        init(from decoder: Decoder) throws {
//            let value = try decoder.container(keyedBy: CityKeys.self)
//            self.pk = try value.decode(Int.self, forKey: .pk)
//            self.name = try value.decode(String.self, forKey: .name)
//        }
//    }
//
//    struct CountryName: Decodable{
//        let pk: Int
//        let name: String
//
//        enum CountryKeys: String, CodingKey {
//            case pk, name
//        }
//
//        init(from decoder: Decoder) throws {
//            let value = try decoder.container(keyedBy: CountryKeys.self)
//            self.pk = try value.decode(Int.self, forKey: .pk)
//            self.name = try value.decode(String.self, forKey: .name)
//        }
//    }
//
//    let pk: Int
//    let cityName: CityName
//    let countryName: CountryName
//    let tourName: String?
//    let thumbnail: String
//    let title: String
//    let review: String?
//    let price: String
//    let category: String?
//    let metaInfo: String?
//
//
//    private enum CodingKeys: String, CodingKey {
//        case pk
//        case cityName
//        case countryName
//        case tourName = "tour_name"
//        case thumbnail
//        case title
//        case review
//        case price
//        case category
//        case metaInfo = "meta_info"
//
//    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        pk = try values.decode(Int.self, forKey: .pk)
//        tourName = try values.decode(String.self, forKey: .tourName)
//        thumbnail = try values.decode(String.self, forKey: .thumbnail)
//        title = try values.decode(String.self, forKey: .title)
//        review = try values.decodeIfPresent(String.self, forKey: .review)
//        price = try values.decode(String.self, forKey: .price)
//        category = try values.decodeIfPresent(String.self, forKey: .category)
//        metaInfo = try values.decodeIfPresent(String.self, forKey: .metaInfo)
//    }
//}


//struct RawProduct: Decodable {
//    let pk: Int
//    struct city: Decodable {
//        let pk: Int
//        let name: String
//    }
//    struct country: Decodable {
//        let pk: Int
//        let name: String
//    }
//    let tour_name: String
//    let thumbnail: String
//    let title: String
//    let review: String?
//    let price: String
//    let category: String?
//    let meta_info: String?
//}
//
//struct ProductResponse: Decodable {
//    let pk: Int
//    let city: String
//    let country: String
//    let tourName: String
//    let thumbnail: String
//    let review: String?
//    let price: String
//    let category: String?
//    let metaInfo: String?
//
//    init(from decoder: Decoder) throws {
//        let rawResponse = try RawProduct(from: decoder)
//
//        pk = Int(rawResponse.pk)
//        city = rawResponse.
//
//    }
//}




extension Data {
    func decode<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T where T: Decodable {
        return try decoder.decode(type, from: self)
    }
}


