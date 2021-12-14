//
//  HomeTableViewCell.swift
//  WooApp
//
//  Created by Hany Alkahlout on 19/11/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dayNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!

    
    func setData(order:Order){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        print("order.date_created! \(order.date_created!)")
        if let date = dateFormatter.date(from: order.date_created!){
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd"
            dayNumberLabel.text = newDateFormatter.string(from: date)
        }
        
        nameLabel.text = order.fullName ?? ""
        
        priceLabel.text = "\(order.total ?? "") \(order.currency ?? "")"
        
        idLabel.text = "\(order.id.value ?? -1)"
        
        let status = order.status ?? ""
        switch status {
        case "on-hold":
            statusLabel.text = "On-Hold"
            statusLabel.textColor = #colorLiteral(red: 0.9254901961, green: 0.8156862745, blue: 0.08235294118, alpha: 1)
            statusImageView.image = UIImage(named: "Path 2")
        case "processing":
            statusLabel.text = "Processing"
            statusLabel.textColor = #colorLiteral(red: 0.2862745098, green: 0.7176470588, blue: 0.3843137255, alpha: 1)
            statusImageView.image = UIImage(named: "Path 1")
        case "completed":
            statusLabel.text = "Completed"
            statusLabel.textColor = UIColor(named: "AppCompleted")
            statusImageView.image = UIImage(named: "Path 24")
        case "concluded":
            statusLabel.text = "Concluded"
            statusLabel.textColor = #colorLiteral(red: 0.6039215686, green: 0.7176470588, blue: 0.8117647059, alpha: 1)
            statusImageView.image = UIImage(named: "Path 3")
        case "failed":
            statusLabel.text = "Failed"
            statusLabel.textColor = #colorLiteral(red: 0.6745098039, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
            statusImageView.image = UIImage(named: "Path 4")
        default:
            break
        }
        
    }
    
}
