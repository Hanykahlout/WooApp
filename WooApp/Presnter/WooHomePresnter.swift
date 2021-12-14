//
//  WooHomePresnter.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import UIKit
import RealmSwift

protocol WooHomePresnterDelegate{
    func showAlert(title:String,message:String)
    func setOrders(orders:Results<Order>)
    func setAllOrderNumbers()
}

typealias WooHomeDelegate = WooHomePresnterDelegate & UIViewController

class WooHomePresnter:NSObject{
    
    weak var delegate:WooHomeDelegate?
    
    func getAllOrdersFromApiToRealm(){
        OrderDatabaseController.shard.clearRealm()
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                var orders = [Order]()
                ApiController.shard.getAllOrders { allOrders in
                    DispatchQueue.main.async {
                        for order in allOrders{
                            let o = Order()
                            o.date_created = order.date_created
                            o.id = RealmOptional<Int>(order.id)
                            o.total = order.total
                            o.currency = order.currency
                            o.status = order.status
                            o.fullName = "\(order.billing?.first_name ?? "") \(order.billing?.last_name ?? "")"
                            o.address = order.billing?.address_1
                            o.country = order.billing?.country
                            o.city = order.billing?.city
                            o.postCode = order.billing?.postcode
                            o.phone = order.billing?.phone
                            o.email = order.billing?.email
                            if let allItems = order.line_items{
                                for _item in allItems{
                                    let item = LineItem()
                                    item.id = RealmOptional<Int>(_item.id)
                                    item.name = _item.name
                                    item.sku = _item.sku
                                    item.price =  RealmOptional<Int>(_item.price)
                                    item.product_id = RealmOptional<Int>(_item.product_id)
                                    item.variation_id = RealmOptional<Int>(_item.variation_id)
                                    OrderDatabaseController.shard.saveItem(item: item, order: o)
                                }
                            }
                            orders.append(o)
                        }
                        OrderDatabaseController.shard.saveOrder(order: orders)
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }
    
    
    func getAllOrderFromRealm(date:Date){
        self.delegate?.setOrders(orders: OrderDatabaseController.shard.getAllOrdersIn(date: date))
        self.delegate?.setAllOrderNumbers()
    }
    
    
  
    
}

