//
//  OrdersApiController.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SVProgressHUD


class ApiController{
    
    public static var shard:ApiController = {
        let ordersApiController = ApiController()
        return ordersApiController
    }()
    
    private init(){}
    
    func getAllOrders(callback:@escaping ([AllOrders])->Void){
        
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.allOrders.url, method: .get , parameters:nil,headers:headers).responseArray { (response:DataResponse<[AllOrders]>) in
            SVProgressHUD.dismiss()
            if let data = response.result.value{
                callback(data)
            }
        }
    }
    
    
    func getAllProducts(callback:@escaping ([AllProducts])->Void){
        
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.allProducts.url, method: .get , parameters:nil,headers:headers).responseArray { (response:DataResponse<[AllProducts]>) in
            SVProgressHUD.dismiss()
            if let data = response.result.value{
                callback(data)
            }
        }
    }
    
    func getAllCustomers(callback:@escaping ([AllCustomers])->Void){
        
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.allCustomers.url, method: .get , parameters:nil,headers:headers).responseArray { (response:DataResponse<[AllCustomers]>) in
            SVProgressHUD.dismiss()
            if let data = response.result.value{
                callback(data)
            }
        }
    }
    
    func updateProduct(id:String,isFav:Bool){
        
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.updateProduct.withId(id: id), method: .put , parameters:["featured":isFav],headers:headers).responseObject { (response:DataResponse<AllProducts>) in
            SVProgressHUD.dismiss()
        }
    }
    
    
    func updatePrivacyOfProduct(id:String,privacy:String){
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.updateProduct.withId(id: id), method: .put , parameters:["status":privacy],headers:headers).responseObject { (response:DataResponse<AllProducts>) in
            SVProgressHUD.dismiss()
        }
    }
    
    func getCategories(callback:@escaping ([CategoryInfo]?)->Void){
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.categories.url, method: .get,headers:headers).responseArray { (response:DataResponse<[CategoryInfo]>) in
            SVProgressHUD.dismiss()
            callback(response.result.value)
        }
    }
    
    func updateQuantityOfProduct(stockQuantity:String,productId:String,vaerationId:String,callback:@escaping (ProductVariation?)->Void){
        
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.productVeration.with(productId: productId, varationId: vaerationId), method: .put,parameters: ["stock_quantity":stockQuantity],headers:headers).responseObject{ (response:DataResponse<ProductVariation>) in
            SVProgressHUD.dismiss()
            callback(response.result.value)
        }
    }
    
    func getVaretions(id:String,callback:@escaping ([ProductVariation]?)->Void){
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Alamofire.request(API_KEYS.allProductVeration.withId(id: id), method: .get,headers:headers).responseArray{ (response:DataResponse<[ProductVariation]>) in
            SVProgressHUD.dismiss()
            callback(response.result.value)
        }
    }
    
    func getProductVerations(productId:String,vaerationId:String,callback:@escaping (ProductVariation?)->Void){
        let user = "ck_aeea247ebc622a484d33f22ee8612c9c7aee0b87"
        let password = "cs_732a024360e59f118e3afb93e9d1922971362027"
        let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        let headers:HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request(API_KEYS.productVeration.with(productId: productId, varationId: vaerationId), method: .get,headers:headers).responseObject{ (response:DataResponse<ProductVariation>) in
            callback(response.result.value)
        }
    }
    
}

