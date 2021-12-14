//
//  ProductDetailsTableViewCell.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 22/11/2021.
//

import UIKit
import RealmSwift

class ProductDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var quntityTextField: UITextField!
    
    private var productId:Int!
    private var vaeration:Variation!
    
    
    func setData(productId:Int,vaeration:Variation){
        self.vaeration = vaeration
        self.productId = productId
        print("Image src: \(vaeration.imageSrc ?? "")")
        self.productImageView.sd_setImage(with: URL(string: vaeration.imageSrc ?? ""))
        self.nameLabel.text = "\(vaeration.name ?? "") : \(vaeration.option ?? "")"
        self.priceLabel.text = vaeration.regular_price ?? ""
        self.quntityTextField.text = "\(vaeration.stock_quantity)"
    }
    
    
    @IBAction func okAction(_ sender: Any) {
        ApiController.shard.updateQuantityOfProduct(stockQuantity: quntityTextField.text!, productId: String(productId), vaerationId: String(vaeration.id.value ?? -1)) { vareationData in }
        ProductDatabaseController.shard.updateVariation(varetion: vaeration, stockQ: Int(quntityTextField.text!)!)
        
    }
    
}
