//
//  CartViewController.swift
//  WooApp
//
//  Created by Hany Alkahlout on 17/11/2021.
//

import UIKit
import DropDown

class OrderDetailsViewController: UIViewController {
    
    @IBOutlet weak var whatsappView: UIView!
    @IBOutlet weak var ChooseCountryView: UIView!
    @IBOutlet weak var countryImageView: UIImageView!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var countryNumberLabel: UILabel!
    
    @IBOutlet weak var ordersTableView: UITableView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ordersTableViewHeightConstrant: NSLayoutConstraint!
    
    @IBOutlet weak var orderIdLabel: UILabel!
    
    @IBOutlet weak var ordeInfo: UILabel!
    
    @IBOutlet weak var orderPhoneNumberLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var shippingCode: UILabel!
    
    private let dropDown = DropDown()
    public var order:Order!
    public var date:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    
    private func initlization(){
        setUpTableView()
        setUpCountriesList()
        ChooseCountryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showCountryList)))
        ordersTableViewHeightConstrant.constant = CGFloat(100 * order.line_item.count)
    }
    
    @objc private func showCountryList(){
        dropDown.show()
    }
    
    private func setUpCountriesList(){
        var countries: [String:String] = [String:String]()
        
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries[name] = code
        }
        // Set Up Drop Down List
        dropDown.anchorView = ChooseCountryView
        dropDown.dataSource = Array(countries.keys)
        
        dropDown.cellNib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? DropDownTableViewCell else { return }
            cell.firstNumbersLabel.text = GeneralActions.shard.getCountryPhonceCode(country: countries[item] ?? "")
        }
        
        self.countryNumberLabel.text = GeneralActions.shard.getCountryPhonceCode(country: order.country!)
        
        dropDown.selectionAction = { index , item in
            self.countryNumberLabel.text = GeneralActions.shard.getCountryPhonceCode(country: countries[item] ?? "")
        }
        
    }
    
    
    private func locale(for fullCountryName : String) -> String {
        for localeCode in NSLocale.isoCountryCodes {
            let identifier = NSLocale(localeIdentifier: localeCode)
            let countryName = identifier.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)
            if fullCountryName.lowercased() == countryName?.lowercased() {
                return localeCode
            }
        }
        return ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ordersTableViewHeightConstrant.constant = CGFloat(order.line_item.count * 100)
        dateLabel.text = date
        orderIdLabel.text = String(order.id.value ?? -1)
        ordeInfo.text = """
\(order.fullName ?? "")
\(order.city ?? "")
\(order.address ?? "")
\(order.postCode ?? "")
"""
        orderPhoneNumberLabel.text = order.phone ?? ""
        emailLabel.text = order.email ?? ""
        setOrderStatusChanges(status: order.status ?? "")
    }
    
    private func setOrderStatusChanges(status:String){
        switch status{
        case "processing":
            statusImageView.image = UIImage(named: "Big Processing")
            statusLabel.text = "Processing"
            statusLabel.textColor = UIColor(named: "AppGreen")
            
        case "on-hold":
            statusImageView.image = UIImage(named: "Big On-Hold")
            statusLabel.text = "Completed"
            statusLabel.textColor = UIColor(named: "AppYallow")
            
        case "concluded":
            statusImageView.image = UIImage(named: "Big Concluded")
            statusLabel.text = "Completed"
            statusLabel.textColor = UIColor(named: "AppConcluded")
            
        case "failed":
            statusImageView.image = UIImage(named: "Big Failed")
            statusLabel.text = "Failed"
            statusLabel.textColor = UIColor(named: "AppRed")
            
        default:
            statusImageView.image = UIImage(named: "Big Completed")
            statusLabel.text = "Completed"
            statusLabel.textColor = UIColor(named: "AppCompleted")
        }
    }
    
    @IBAction func copyAction(_ sender: UIButton) {
    }
    
    
    @IBAction func whatsappAction(_ sender: UIButton) {
        phoneNumberTextField.text = orderPhoneNumberLabel.text!
        whatsappView.isHidden = false
    }
    
    
    @IBAction func whatsappAlertAction(_ sender: Any) {
        whatsappView.isHidden = true
        let number = "\(countryNumberLabel.text!)\(orderPhoneNumberLabel.text!)"
        let message = UserDefaults.standard.string(forKey: "WhatsappMessage") ?? ""
        let text = message.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        if let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(number)&text=\(text!)"){
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
    }
    
}


extension OrderDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    private func setUpTableView(){
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        ordersTableView.register(.init(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.line_item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        cell.setData(data: order.line_item[indexPath.row])
        return cell
    }
    
    
}
