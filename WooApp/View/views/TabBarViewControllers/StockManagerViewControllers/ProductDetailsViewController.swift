//
//  ProductDetailsViewController.swift
//  WooApp
//
//  Created by Dev. Hany Alkahlout on 22/11/2021.
//

import UIKit
import RealmSwift

class ProductDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var varTableView: UITableView!
    
    @IBOutlet weak var idNameLabel: UILabel!
    
    @IBOutlet weak var skuLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var statusButton: UIButton!
    
    @IBOutlet weak var isFavButton: UIButton!
    
    public var product:Product!
    private var variations = [Variation]()
    private let presnter = ProductDetailsPresnter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    
    private func initlization(){
        presnter.delegate = self
        setUpTableView()
        tableHeight.constant = CGFloat(product.variations.count * 90)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        idNameLabel.text = "Item \(String(product.id.value ?? -1)) - \(product.name ?? "")"
        skuLabel.text = product.sku ?? ""
        priceLabel.text = product.price ?? ""
        productImageView.sd_setImage(with: URL(string: product.imageSrc ?? ""))
        if product.status == "publish"{
            statusButton.setImage(UIImage(named: "shared-vision"), for: .normal)
            statusButton.setTitle("Public", for: .normal)
        }else{
            statusButton.setImage(UIImage(named: "images"), for: .normal)
            statusButton.setTitle("Private", for: .normal)
        }
        isFavButton.isSelected = product.featured.value ?? false
        if ProductDatabaseController.shard.getVariationsById(id: product.variations.first ?? -1).isEmpty{
            if let id = product.id.value{
                presnter.getAllVaretionsFromApiToRealm(productId: String(id))
            }
        }else{
            presnter.getAllVaretionsFromRealm()
        }
        
    }
    
    
    @IBAction func statusAction(_ sender: Any) {
        if statusButton.titleLabel?.text == "Private"{
            statusButton.setImage(UIImage(named: "shared-vision"), for: .normal)
            statusButton.setTitle("Public", for: .normal)
            ApiController.shard.updatePrivacyOfProduct(id: String(product.id.value!), privacy: "publish")
            ProductDatabaseController.shard.updateProduct(product: product, status: "publish")
        }else{
            statusButton.setImage(UIImage(named: "images"), for: .normal)
            statusButton.setTitle("Private", for: .normal)
            ApiController.shard.updatePrivacyOfProduct(id: String(product.id.value!), privacy: "private")
            ProductDatabaseController.shard.updateProduct(product: product, status: "private")
        }
    }
    
    
    @IBAction func isFavAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        ApiController.shard.updateProduct(id: String(product.id.value!), isFav: sender.isSelected)
        ProductDatabaseController.shard.updateProduct(product: product, isFav: sender.isSelected)
    }
    
}


extension ProductDetailsViewController:UITableViewDelegate , UITableViewDataSource{
    private func setUpTableView(){
        varTableView.delegate = self
        varTableView.dataSource = self
        varTableView.register(.init(nibName: "ProductDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductDetailsTableViewCell")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return variations.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as! ProductDetailsTableViewCell
        cell.setData(productId: product.id.value ?? -1, vaeration: variations[indexPath.row])
        return cell
    }
    
    
}


extension ProductDetailsViewController:ProductDetailsPresnterDelegate{
    func showAlert(title: String, message: String) {
        GeneralActions.shard.showAlert(viewController: self, title: title, message: message)
    }
    
    func setAllVerations(varetions: Results<Variation>) {
        self.variations = varetions.toArray(ofType: Variation.self) as [Variation]
        varTableView.reloadData()
    }
    
    
}
