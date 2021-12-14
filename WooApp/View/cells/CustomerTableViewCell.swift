//
//  CustomerTableViewCell.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var totalOrdersLabel: UILabel!
    
    
    func setData(customer:AllCustomers){
        nameLabel.text = "\(customer.first_name ?? "") \(customer.last_name ?? "")"
//        totalValueLabel.text = "$R \(customer.)"
//        totalOrdersLabel.text = "$R \(customer.)"
    }
    
}
