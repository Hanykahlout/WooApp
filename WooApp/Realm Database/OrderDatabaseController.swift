//
//  OrderDatabaseController.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 28/11/2021.
//

import Foundation
import RealmSwift

class OrderDatabaseController{
    
    public static var shard:OrderDatabaseController = {
        let orderDatabaseController = OrderDatabaseController()
        return orderDatabaseController
    }()
    
    private let realm = try! Realm()
    private let newDateFormatter = DateFormatter()
    
    private init(){
        newDateFormatter.dateFormat = "yyyy-MM"
    }
    
    
    func saveOrder(order:[Order]){
        try! realm.write{
            realm.add(order)
        }
    }
    
    func search(name:String,date:Date) -> Results<Order>{
        let orders = realm.objects(Order.self).filter("fullName LIKE '\(name)*' AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        return orders
    }
    
    func getTotalOrderPrice(date:Date) ->Float{
        var count:Float = 0.0
        let orders = realm.objects(Order.self).filter("(status = 'completed' or status = 'processing') AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        for order in orders{
            let num = Float(order.total ?? "0")!
            count = count + num
        }
        return count
    }
    
    
    func clearRealm(){
        try! realm.write {
            realm.delete( realm.objects(Order.self))
            realm.delete( realm.objects(LineItem.self))
        }
    }
    
    
    func isEmpty()->Bool{
        return realm.objects(Order.self).isEmpty
    }
    
    
    func getAllOrdersBy(status:OrderType,date:Date) -> Results<Order>{
        switch status{
        case .Processing:
            return realm.objects(Order.self).filter("(status = 'completed' or status = 'processing') AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        case .On_Hold:
            return realm.objects(Order.self).filter("status = 'on-hold' AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        case .Concluded:
            return realm.objects(Order.self).filter("status = 'concluded' AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        case .Failed:
            return realm.objects(Order.self).filter("(status = 'failed' or status = 'canceled') AND date_created LIKE '\(newDateFormatter.string(from: date))*'")
        case .All:
            return realm.objects(Order.self)
        }
    }
    
    
    func getAllOrdersIn(date:Date) -> Results<Order>{
        let allOrders = realm.objects(Order.self).filter("date_created LIKE '\(newDateFormatter.string(from: date))*'")
        return allOrders
    }
    
    
    func saveItem(item:LineItem,order:Order) {
        try! realm.write{
            order.line_item.append(item)
        }
    }
    
    func getAllItems() -> Results<LineItem>{
        let allOrders = realm.objects(LineItem.self)
        return allOrders
    }
    
}

enum OrderType{
    case Processing,On_Hold,Concluded,Failed,All
}
