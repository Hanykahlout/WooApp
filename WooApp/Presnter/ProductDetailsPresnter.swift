//
//  ProductDetailsPresnter.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 10/12/2021.
//

import UIKit
import RealmSwift

protocol ProductDetailsPresnterDelegate{
    func showAlert(title:String,message:String)
    func setAllVerations(varetions:Results<Variation>)
}


typealias ProductDetailsDelegate = ProductDetailsPresnterDelegate & UIViewController

class ProductDetailsPresnter:NSObject{
    
    weak var delegate:ProductDetailsDelegate?
    
    func getAllVaretionsFromApiToRealm(productId:String){
        ProductDatabaseController.shard.clearVaretions()
        ApiController.shard.getVaretions(id: productId) { data in
            if let data = data {
                var varetionResult = [Variation]()
                for varation in data{
                    let realmVaration = Variation()
                    realmVaration.id = RealmOptional<Int>(varation.id)
                    let att = varation.attributes?.first
                    realmVaration.name = att?.name
                    realmVaration.option = att?.option
                    realmVaration.imageSrc = varation.image?.src
                    realmVaration.regular_price = varation.regular_price
                    realmVaration.stock_quantity = varation.stock_quantity ?? 0
                    varetionResult.append(realmVaration)
                }
                ProductDatabaseController.shard.saveVariation(variation: varetionResult)
                DispatchQueue.main.async {
                    self.getAllVaretionsFromRealm()
                }
            }
        }
    }
    
    
    func getAllVaretionsFromRealm(){
        self.delegate?.setAllVerations(varetions: ProductDatabaseController.shard.getVariations())
    }

    
}



