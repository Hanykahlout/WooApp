//
//  ProgressPresnter.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import UIKit


protocol ProgressPresnterDelegate{
    func showAlert(title:String,message:String)
    func setProducts(products:[AllProducts])
    func setCustomers(customers:[AllCustomers])
    func setOrders(orders:[AllOrders])
}

typealias ProgressDelegate = ProgressPresnterDelegate & UIViewController

class ProgressPresnter:NSObject{
    
    weak var delegate:ProgressDelegate?
    
    func getAllProducts(){
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                ApiController.shard.getAllProducts { products in
                    DispatchQueue.main.async {
                        self.delegate?.setProducts(products: products)
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }
    
    
    func getAllCustomers(){
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                ApiController.shard.getAllCustomers { customers in
                    DispatchQueue.main.async {
                        self.delegate?.setCustomers(customers: customers)
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }
    
    
    func getAllOrders(){
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                ApiController.shard.getAllOrders { orders in
                    DispatchQueue.main.async {
                        self.delegate?.setOrders(orders: orders)
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }
    
    
}
