//
//  ProgressViewController.swift
//  WooApp
//
//  Created by Hany Alkahlout on 17/11/2021.
//

import UIKit

class ProductsOrdersViewController: UIViewController {
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var productsView: UIView!
    @IBOutlet weak var clientsView: UIView!
    @IBOutlet weak var ordersView: UIView!
    @IBOutlet weak var ordersTableView: UITableView!
    
    private var products = [AllProducts]()
    private var customers = [AllCustomers]()
    private var orders = [AllOrders]()
    
    private var cellType:ProgressCellType = .products
    private let presnter = ProgressPresnter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    
    private func initlization(){
        if let imageData = UserDefaults.standard.data(forKey: "AppLogo") {
            appLogoImageView.image = UIImage(data: imageData)
        }
        presnter.delegate = self
        setUpViews()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presnter.getAllProducts()
    }
    
    private func setUpViews(){
        productsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(productsViewAction)))
        clientsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clientsViewAction)))
        ordersView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ordersViewAction)))
    }
    
    @objc private func productsViewAction(){
        cellType = .products
        presnter.getAllProducts()
    }
    
    
    @objc private func clientsViewAction(){
        cellType = .customers
        presnter.getAllCustomers()
    }
    
    
    @objc private func ordersViewAction(){
        cellType = .orders
        presnter.getAllOrders()
    }
    
    
    
    
}

extension ProductsOrdersViewController:UITableViewDelegate,UITableViewDataSource{
    private func setUpTableView(){
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        ordersTableView.register(.init(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "ProgressTableViewCell")
        ordersTableView.register(.init(nibName: "CustomerTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomerTableViewCell")
        ordersTableView.register(.init(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellType{
        case .products:
            return products.count
        case .customers:
            return customers.count
        case .orders:
            return orders.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch cellType{
        case .products:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell") as! ProgressTableViewCell
            cell.setData(product: products[indexPath.row])
            return cell
        case .customers:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell") as! CustomerTableViewCell
            cell.setData(customer: customers[indexPath.row])
            return cell
        case .orders:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell") as! OrdersTableViewCell
            cell.setData(order: orders[indexPath.row])
            return cell
        }
        
    }
    
}

extension ProductsOrdersViewController:ProgressPresnterDelegate{
    func showAlert(title: String, message: String) {
        GeneralActions.shard.showAlert(viewController: self, title: title, message: message)
    }
    func setOrders(orders: [AllOrders]) {
        self.orders = orders
        ordersTableView.reloadData()
    }
    
    func setCustomers(customers: [AllCustomers]) {
        self.customers = customers
        ordersTableView.reloadData()
    }
    
    func setProducts(products: [AllProducts]) {
        self.products = products
        ordersTableView.reloadData()
    }
    
    
}

enum ProgressCellType{
    case products , customers , orders
}
