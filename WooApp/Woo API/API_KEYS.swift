//
//  API_KEYS.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import Foundation

enum API_KEYS: String {
    
    case BASE_URL = "https://store.woorich.app/wp-json/wc/v3/"
    
    case allOrders = "orders"
    case allProducts = "products"
    case allCustomers = "customers"
    case updateProduct = "products/{id}"
    case categories = "products/categories"
    case allProductVeration = "products/{id}/variations"
    case productVeration = "products/{id1}/variations/{id2}"
    
    var url: String {
        switch self {
        case .BASE_URL:
            return API_KEYS.BASE_URL.rawValue
        default:
            return "\(API_KEYS.BASE_URL.rawValue)\(self.rawValue)"
        }
    }
    
    func withId(id: String) -> String {
        switch self {
        case .updateProduct:
            return "\(API_KEYS.BASE_URL.rawValue)\(self.rawValue.replacingOccurrences(of: "{id}", with: "\(id)"))"
        case .allProductVeration:
            return "\(API_KEYS.BASE_URL.rawValue)\(self.rawValue.replacingOccurrences(of: "{id}/variations", with: "\(id)/variations"))"
        default:
            return ""
        }
    }
    
    func with(productId:String,varationId:String) -> String{
        return "\(API_KEYS.BASE_URL.rawValue)\(self.rawValue.replacingOccurrences(of: "{id1}/variations/{id2}", with: "\(productId)/variations/\(varationId)"))"
    }
    
}




