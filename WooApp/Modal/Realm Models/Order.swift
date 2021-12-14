//
//  Order.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 28/11/2021.
//

import UIKit
import RealmSwift

class Order:Object{
    
    var id = RealmOptional<Int>()
    @objc dynamic var status : String?
    @objc dynamic var currency : String?
    @objc dynamic var date_created : String?
    @objc dynamic var total : String?
    @objc dynamic var fullName : String?
    @objc dynamic var address : String?
    @objc dynamic var country : String?
    @objc dynamic var city : String?
    @objc dynamic var postCode : String?
    @objc dynamic var phone : String?
    @objc dynamic var email : String?
    var line_item = List<LineItem>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
