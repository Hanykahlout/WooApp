//
//  ProductDatabaseController.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 02/12/2021.
//

import Foundation
import RealmSwift

class ProductDatabaseController{
    
    public static var shard:ProductDatabaseController = {
        let productDatabaseController = ProductDatabaseController()
        return productDatabaseController
    }()
    
    private let realm = try! Realm()
    
    private init(){}
    
    func saveProduct(product:[Product]){
        try! realm.write{
            realm.add(product)
        }
    }
    
    func getProducts() -> Results<Product>{
        return realm.objects(Product.self)
    }
    
    
    func clearRealm(){
        try! realm.write {
            realm.delete(realm.objects(Product.self))
            realm.delete(realm.objects(Category.self))
        }
    }
    
    
    func updateProduct(product:Product,isFav:Bool){
        try! realm.write {
            product.featured = RealmOptional<Bool>(isFav)
        }
    }
    
    
    func updateProduct(product:Product,status:String){
        try! realm.write {
            product.status = status
        }
    }
    
    func search(name:String) -> Results<Product>{
        let products = realm.objects(Product.self).filter("name LIKE '\(name)*' OR sku LIKE '\(name)*'")
        return products
    }
    
    func save(category:Category,product:Product) {
        try! realm.write{
            product.categries.append(category)
        }
    }
    
    func save(vartionId:Int,product:Product) {
        try! realm.write{
            product.variations.append(vartionId)
        }
    }
    
    func getProductById(id:Int) -> Product?{
        let products = realm.objects(Product.self).filter("id = \(id)").first
        return products
    }
    
    func saveVariation(variation:[Variation]){
        try! realm.write{
            realm.add(variation)
        }
    }
    
    func getVariations() -> Results<Variation>{
        let variations = realm.objects(Variation.self)
        return variations
    }
    
    func getVariationsById(id:Int) -> Results<Variation>{
        let variations = realm.objects(Variation.self).filter("id = \(id)")
        return variations
    }
    
    func clearVaretions(){
        try! realm.write {
            realm.delete(realm.objects(Variation.self))
        }
    }
    
    func updateVariation(varetion:Variation,stockQ:Int){
        try! realm.write {
            varetion.stock_quantity = stockQ
        }
    }
    
    
}


