//
//  SettingsViewController.swift
//  WooApp
//
//  Created by Hany Alkahlout on 17/11/2021.
//

import UIKit
import RealmSwift
import DropDown
class StockManagerViewController: UIViewController {
    @IBOutlet weak var appLogoImageView: UIImageView!
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var noOrderLabel: UILabel!
    @IBOutlet weak var totalProductsLabel: UILabel!
    
    private let dropDown = DropDown()
    private var products = [Product]()
    private var apiCategories = [CategoryInfo]()
    private var categories = [String]()
    private let presnter = StockManagerPresnter()
    let refreshControl:UIRefreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    
    private func initlization(){
        searchTextField.delegate = self
        presnter.delegate = self
        setUpTableView()
        refrech()
        categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(categoryAction)))
        presnter.getAllProductFromRealm()
        presnter.getCategories()
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let imageData = UserDefaults.standard.data(forKey: "AppLogo") {
            appLogoImageView.image = UIImage(data: imageData)
        }
    }
    
    
    
    private func refrech() {
        refreshControl.addTarget(self, action: #selector(change), for: .valueChanged)
        productsTableView.refreshControl = refreshControl
    }
    
    
    private func setUpDropDownList(){
        dropDown.anchorView = categoryView
        dropDown.dataSource = self.categories
        dropDown.selectionAction = { index , item in
            self.categoryLabel.text = item
            if item == "All"{
                DispatchQueue.main.async {
                    self.presnter.getAllProductFromRealm()
                }
            }else{
                if let id = self.apiCategories[index].id{
                    DispatchQueue.main.async {
                        self.products = self.presnter.getAllProductForCurrentCategory(id: id)
                        self.productsTableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    @objc func change() {
        products.removeAll()
        productsTableView.reloadData()
        presnter.getAllProductFromApi()
    }
    
    @objc func categoryAction() {
        dropDown.show()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        search(textField: searchTextField)
    }
    
    
}

extension StockManagerViewController:UITableViewDelegate,UITableViewDataSource{
    private func setUpTableView(){
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        productsTableView.register(.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        cell.setData(product: products[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailsViewController()
        vc.product = products[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension StockManagerViewController: StockManagerPresnterDelegate{
    func showAlert(title: String, message: String) {
        GeneralActions.shard.showAlert(viewController: self, title: title, message: message)
    }
    
    func setCategories(categories: [CategoryInfo]) {
        self.categories.append("All")
        self.apiCategories = categories
        for category in categories{
            if let name = category.name {
                self.categories.append(name)
            }
        }
        setUpDropDownList()
    }
    
    func setProducts(products: Results<Product>) {
        self.products = products.toArray(ofType: Product.self) as [Product]
        self.products = self.products.reversed()
        productsTableView.reloadData()
        if refreshControl.isRefreshing{
            refreshControl.endRefreshing()
        }
        noOrderLabel.isHidden = !self.products.isEmpty
        totalProductsLabel.text = "\(self.products.count)"
    }
    
    
}


extension StockManagerViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search(textField: textField)
        return true
    }
    
    private func search(textField:UITextField){
        if textField.text! != ""{
            let products = ProductDatabaseController.shard.search(name: textField.text!)
            self.products = products.toArray(ofType: Product.self) as [Product]
            productsTableView.reloadData()
            noOrderLabel.isHidden = !self.products.isEmpty
            textField.endEditing(true)
        }else{
            presnter.getAllProductFromRealm()
        }
    }
    
    
}
