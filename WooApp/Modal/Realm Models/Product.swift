//
//  Product.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 02/12/2021.
//

import Foundation
import RealmSwift

class Product: Object{
    
    var id = RealmOptional<Int>()
    @objc dynamic var price : String?
    @objc dynamic var type : String?
    @objc dynamic var imageSrc : String?
    @objc dynamic var name : String?
    @objc dynamic var sku : String?
    @objc dynamic var status : String?
    var featured = RealmOptional<Bool>()
    var categries = List<Category>()
    var variations = List<Int>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
