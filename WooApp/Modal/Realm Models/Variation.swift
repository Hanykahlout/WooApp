//
//  Variation.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 10/12/2021.
//

import Foundation
import RealmSwift

class Variation:Object{
    
    var id = RealmOptional<Int>()
    @objc dynamic var imageSrc : String?
    @objc dynamic var name : String?
    @objc dynamic var option : String?
    @objc dynamic var regular_price : String?
    @objc dynamic var stock_quantity:Int = 0

    override class func primaryKey() -> String? {
        return "id"
    }
    
}
