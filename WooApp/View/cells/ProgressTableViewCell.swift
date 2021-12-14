//
//  ProgressTableViewCell.swift
//  WooApp
//
//  Created by Hany Alkahlout on 19/11/2021.
//

import UIKit
import SDWebImage
class ProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var totalOrderLabel: UILabel!
    
    
    func setData(product:AllProducts){
        productImageView.sd_setImage(with: URL(string: product.images?.first?.src ?? ""))
        itemNumberLabel.text = "item \(product.id ?? -1)"
        totalValueLabel.text = "R$ \(product.sale_price ?? "")"
        totalOrderLabel.text = String(product.total_sales ?? 0)
        
    }
    
}
