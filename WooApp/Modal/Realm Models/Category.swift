//
//  Category.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 07/12/2021.
//

import Foundation
import RealmSwift

class Category: Object{
    var id = RealmOptional<Int>()
    @objc dynamic var name : String?
    @objc dynamic var slug : String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
