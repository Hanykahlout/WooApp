//
//  CartTableViewCell.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 22/11/2021.
//

import UIKit

class CartTableViewCell: UITableViewCell{
    
    @IBOutlet weak var nameLablel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var quntityLabel: UILabel!
    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    private let presnter = CartTableCellPresnter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        presnter.delegate = self
    }
    
    func setData(data:LineItem){
        nameLablel.text = data.name ?? ""
        quntityLabel.text = "X\(data.quantity.value ?? 0)"
        skuLabel.text = data.sku ?? ""
        priceLabel.text = "$ \(data.price.value ?? -1)"
        presnter.getProductImage(lineItem: data)
    }
    
}


extension CartTableViewCell:CartTableCellPresnterDelegate{
    func setCellImage(imageUrl: String) {
        self.itemImageView.sd_setImage(with: URL(string: imageUrl))
    }
    
}

