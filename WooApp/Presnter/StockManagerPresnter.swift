//
//  StockManagerPresnter.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 02/12/2021.
//

import UIKit
import RealmSwift
protocol StockManagerPresnterDelegate{
    func showAlert(title:String,message:String)
    func setProducts(products:Results<Product>)
    func setCategories(categories:[CategoryInfo])
}

typealias StockManagerDelegate = StockManagerPresnterDelegate & UIViewController

class StockManagerPresnter:NSObject{
    
    weak var delegate:StockManagerDelegate?
    
    func getAllProductFromApi(){
        ProductDatabaseController.shard.clearRealm()
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                ApiController.shard.getAllProducts { products in
                    var resultProducts = [Product]()
                    for product in products{
                        let p = Product()
                        p.id = RealmOptional<Int>(product.id)
                        p.price = product.price
                        p.type = product.type
                        p.imageSrc = product.images?.first?.src
                        p.name = product.name
                        p.sku = product.sku
                        p.status = product.status
                        p.featured = RealmOptional<Bool>(product.featured)
                        if let variations = product.variations {
                            for variation in variations {
                                ProductDatabaseController.shard.save(vartionId: variation, product: p)
                            }
                        }
                        if let categries = product.categories {
                            for categry in categries {
                                let realmCategory = Category()
                                realmCategory.id = RealmOptional<Int>(categry.id)
                                realmCategory.name = categry.name
                                realmCategory.slug = categry.slug
                                ProductDatabaseController.shard.save(category: realmCategory, product: p)
                            }
                        }
                        resultProducts.append(p)
                    }
                    ProductDatabaseController.shard.saveProduct(product: resultProducts)
                    self.getAllProductFromRealm()
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }
    
    
    func getAllProductFromRealm(){
        delegate?.setProducts(products: ProductDatabaseController.shard.getProducts())
    }
    
    func getCategories(){
        GeneralActions.shard.monitorNetwork {
            DispatchQueue.main.async {
                ApiController.shard.getCategories { categories in
                    DispatchQueue.main.async {
                        self.delegate?.setCategories(categories: categories ?? [])
                    }
                }
            }
        } notConectedAction: {
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Error", message: "Internet Conncetion Error")
            }
        }
    }

    
    func getAllProductForCurrentCategory(id:Int) -> [Product]{
        let products = ProductDatabaseController.shard.getProducts()
        var result = [Product]()
        for product in products{
            for category in product.categries{
                if category.id.value == id{
                    result.append(product)
                }
            }
        }
        return result
    }
    
}





