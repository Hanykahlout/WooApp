//
//  LineItem.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 08/12/2021.
//

import Foundation
import RealmSwift

class LineItem:Object{
    var id = RealmOptional<Int>()
    @objc dynamic var name : String?
    @objc dynamic var sku : String?
    var price = RealmOptional<Int>()
    var quantity = RealmOptional<Int>()
    var product_id = RealmOptional<Int>()
    var variation_id = RealmOptional<Int>()

    override class func primaryKey() -> String? {
        return "id"
    }
    
}
