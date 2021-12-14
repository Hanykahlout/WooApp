//
//  CartTableCellPresnter.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 14/12/2021.
//

import UIKit

protocol CartTableCellPresnterDelegate{
    func setCellImage(imageUrl:String)
}

typealias CartTableCellDelegate = CartTableCellPresnterDelegate & UITableViewCell

class CartTableCellPresnter:NSObject{
    
    weak var delegate:CartTableCellDelegate?
    
    func getProductImage(lineItem:LineItem){
        if let productId = lineItem.product_id.value , let verationId = lineItem.variation_id.value{
            let product = ProductDatabaseController.shard.getProductById(id: productId)
            if let product = product {
                if product.type != "simple"{
                    ApiController.shard.getProductVerations(productId: String(productId), vaerationId: String(verationId)) { veration in
                        if let veration = veration{
                            DispatchQueue.main.async {
                                self.delegate?.setCellImage(imageUrl: veration.image?.src ?? "")
                            }
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        self.delegate?.setCellImage(imageUrl: product.imageSrc ?? "")
                    }
                }
            }
        }
    }

}

