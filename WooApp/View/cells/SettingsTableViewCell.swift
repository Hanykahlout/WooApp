//
//  SettingsTableViewCell.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 22/11/2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func setData(product:Product){
        productImageView.sd_setImage(with: URL(string: product.imageSrc ?? ""))
        idLabel.text = "\(product.name ?? "")"
        priceLabel.text = "$ \(product.price ?? "")"
    }
    
}
