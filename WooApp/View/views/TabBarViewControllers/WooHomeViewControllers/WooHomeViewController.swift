//
//  WooHomeViewController.swift
//  WooApp
//
//  Created by Hany Alkahlout on 17/11/2021.
//

import UIKit
import RealmSwift

class WooHomeViewController: UIViewController {
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var noOrderLabel: UILabel!
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var completedPriceNumberLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var processingView: UIView!
    @IBOutlet weak var on_HoldView: UIView!
    @IBOutlet weak var concludedView: UIView!
    @IBOutlet weak var failedView: UIView!
    
    
    @IBOutlet weak var progressNumberLabel: UILabel!
    @IBOutlet weak var on_holdNumberLabel: UILabel!
    @IBOutlet weak var concludedNumberLabel: UILabel!
    @IBOutlet weak var failedNumberLabel: UILabel!
    
    private var ordersType:OrderType = .All
    private var selectedDate = Date()
    private let productPresnter = StockManagerPresnter()
    private let homePresnter = WooHomePresnter()
    private var orders = [Order]()
    let refreshControl:UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
        
    }
    
    private func initlization(){
        productPresnter.delegate = self
        homePresnter.delegate = self
        searchTextField.delegate = self
        setUpViews()
        setTableView()
        refrech()
        homePresnter.getAllOrdersFromApiToRealm()
        productPresnter.getAllProductFromApi()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        dateLabel.text = dateFormatter.string(from: selectedDate)
        homePresnter.getAllOrderFromRealm(date: selectedDate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let imageData = UserDefaults.standard.data(forKey: "AppLogo") {
            appLogoImageView.image = UIImage(data: imageData)
        }
    }
    
    private func setUpViews(){
        processingView.isUserInteractionEnabled = true
        on_HoldView.isUserInteractionEnabled = true
        concludedView.isUserInteractionEnabled = true
        failedView.isUserInteractionEnabled = true
        processingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(processingViewAction)))
        on_HoldView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(on_HoldViewAction)))
        concludedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(concludedViewAction)))
        failedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(failedViewAction)))
        
    }
    
    
    
    private func refrech() {
        refreshControl.addTarget(self, action: #selector(change), for: .valueChanged)
        ordersTableView.refreshControl = refreshControl
    }
    
    @objc func change() {
        orders.removeAll()
        ordersTableView.reloadData()
        homePresnter.getAllOrdersFromApiToRealm()
        homePresnter.getAllOrderFromRealm(date: selectedDate)
    }
    
    @objc private func processingViewAction(){
        if ordersType != .Processing{
            processingView.backgroundColor = UIColor(named: "DarkGray")
            failedView.backgroundColor = UIColor(named: "LightGray")
            on_HoldView.backgroundColor = UIColor(named: "LightGray")
            concludedView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .Processing
            let orders = OrderDatabaseController.shard.getAllOrdersBy(status: .Processing,date: selectedDate)
            self.orders = orders.toArray(ofType: Order.self) as [Order]
            ordersTableView.reloadData()
        }else{
            processingView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .All
            homePresnter.getAllOrderFromRealm(date: selectedDate)
        }
        noOrderLabel.isHidden = !self.orders.isEmpty
    }
    
    
    @objc private func on_HoldViewAction(){
        if ordersType != .On_Hold{
            on_HoldView.backgroundColor = UIColor(named: "DarkGray")
            failedView.backgroundColor = UIColor(named: "LightGray")
            processingView.backgroundColor = UIColor(named: "LightGray")
            concludedView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .On_Hold
            let orders = OrderDatabaseController.shard.getAllOrdersBy(status: .On_Hold,date: selectedDate)
            self.orders = orders.toArray(ofType: Order.self) as [Order]
            ordersTableView.reloadData()
        }else{
            on_HoldView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .All
            homePresnter.getAllOrderFromRealm(date: selectedDate)
        }
        noOrderLabel.isHidden = !self.orders.isEmpty
    }
    
    
    @objc private func concludedViewAction(){
        if ordersType != .Concluded{
            concludedView.backgroundColor = UIColor(named: "DarkGray")
            failedView.backgroundColor = UIColor(named: "LightGray")
            on_HoldView.backgroundColor = UIColor(named: "LightGray")
            processingView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .Concluded
            let orders = OrderDatabaseController.shard.getAllOrdersBy(status: .Concluded,date: selectedDate)
            self.orders = orders.toArray(ofType: Order.self) as [Order]
            ordersTableView.reloadData()
        }else{
            concludedView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .All
            homePresnter.getAllOrderFromRealm(date: selectedDate)
        }
        noOrderLabel.isHidden = !self.orders.isEmpty
    }
    
    
    @objc private func failedViewAction(){
        if ordersType != .Failed{
            failedView.backgroundColor = UIColor(named: "DarkGray")
            processingView.backgroundColor = UIColor(named: "LightGray")
            on_HoldView.backgroundColor = UIColor(named: "LightGray")
            concludedView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .Failed
            let orders = OrderDatabaseController.shard.getAllOrdersBy(status: .Failed,date: selectedDate)
            self.orders = orders.toArray(ofType: Order.self) as [Order]
            ordersTableView.reloadData()
        }else{
            failedView.backgroundColor = UIColor(named: "LightGray")
            ordersType = .All
            homePresnter.getAllOrderFromRealm(date: selectedDate)
        }
        noOrderLabel.isHidden = !self.orders.isEmpty
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        search(textField: searchTextField)
    }
    
    
    @IBAction func backDateAction(_ sender: Any) {
        let backMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)
        selectedDate = backMonth!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        dateLabel.text = dateFormatter.string(from: selectedDate)
        homePresnter.getAllOrderFromRealm(date: selectedDate)
    }
    
    @IBAction func forwordDateAction(_ sender: Any) {
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)
        selectedDate = nextMonth!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        dateLabel.text = dateFormatter.string(from: selectedDate)
        homePresnter.getAllOrderFromRealm(date: selectedDate)
    }
    
}

extension WooHomeViewController:UITableViewDelegate,UITableViewDataSource{
    private func setTableView(){
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        ordersTableView.register(.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.setData(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderDetailsViewController") as! OrderDetailsViewController
        vc.order = orders[indexPath.row]
        vc.date = dateLabel.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension WooHomeViewController:WooHomePresnterDelegate,StockManagerPresnterDelegate{
    func setProducts(products: Results<Product>) {
        // no need to this function here.
    }
    
    
    func setCategories(categories: [CategoryInfo]) {
        // no need to this function here.
    }
    
    
    func showAlert(title: String, message: String) {
        GeneralActions.shard.showAlert(viewController: self, title: title, message: message)
    }
    
    
    func setOrders(orders: Results<Order>) {
        self.orders = orders.toArray(ofType: Order.self) as [Order]
        ordersTableView.reloadData()
        if refreshControl.isRefreshing{
            refreshControl.endRefreshing()
        }
        noOrderLabel.isHidden = !self.orders.isEmpty
    }
    
    
    func setAllOrderNumbers(){
        progressNumberLabel.text = String(OrderDatabaseController.shard.getAllOrdersBy(status: .Processing,date: selectedDate).count)
        on_holdNumberLabel.text = String(OrderDatabaseController.shard.getAllOrdersBy(status: .On_Hold,date: selectedDate).count)
        concludedNumberLabel.text = String(OrderDatabaseController.shard.getAllOrdersBy(status: .Concluded,date: selectedDate).count)
        failedNumberLabel.text = String(OrderDatabaseController.shard.getAllOrdersBy(status: .Failed,date: selectedDate).count)
        completedPriceNumberLabel.text = "\(OrderDatabaseController.shard.getTotalOrderPrice(date: selectedDate))"
    }
    

}



extension WooHomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search(textField: textField)
        return true
    }
    
    private func search(textField:UITextField){
        let orders = OrderDatabaseController.shard.search(name: textField.text!,date:selectedDate)
        self.orders = orders.toArray(ofType: Order.self) as [Order]
        ordersTableView.reloadData()
        
        noOrderLabel.isHidden = !self.orders.isEmpty
        textField.endEditing(true)
    }
    
}


