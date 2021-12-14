//
//  OrdersTableViewCell.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 26/11/2021.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var totalOrdersLabel: UILabel!
    
    
    func setData(order:AllOrders){
        nameLabel.text = "\(order.billing?.first_name ?? "") \(order.billing?.last_name ?? "")"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: order.date_created!){
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "YYYY.MM.DD"
            dateLabel.text = "Date: \(newDateFormatter.string(from: date))"
        }
        
        idLabel.text = String(order.id ?? -1)
        
        totalOrdersLabel.text = order.total ?? ""
        
    }
}
