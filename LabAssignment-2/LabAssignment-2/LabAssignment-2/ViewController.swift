//
//  ViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-21.
//

import UIKit
import CoreData

struct Produc {
    var id: UUID?
    var name: String = ""
    var productDescription: String = ""
    var price: Double = 0.0
    var provider: String = ""
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    private let button: UIButton = {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewListButton: UIButton!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldDescription: UITextField!
    
    @IBOutlet weak var searchProductButton: UIButton!
    
    var product: ProductItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product = fetchFirstProduct()
        print("fetched product", product!.name)
        print("fetched descr", product!.productDescription)
        //displayProductInfo(product)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20

        
        tableView.dataSource = self
        tableView.delegate = self

        
        tableView.reloadData()
    }
    
    func fetchFirstProduct() -> ProductItem? {
        // 1. Get the managed object context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // 2. Create the fetch request for ProductEntity
        let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()
        
        // 3. Set the fetch limit to 1 (only fetch the first product)
        fetchRequest.fetchLimit = 1
        
        // 4. Perform the fetch
        do {
            let products = try context.fetch(fetchRequest)
            
            // Return the first product if available
            return products.first
        } catch {
            // Handle error (e.g., print it)
            print("Failed to fetch first product: \(error.localizedDescription)")
            return nil
        }
    }
    
              
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // We have 3 rows for product name, description, and price
            return 4
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("aaa")
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            guard let product = product else { return cell }
            
            //cell.textLabel?.text = "Name: \(product.name)"
            
            
            switch indexPath.row {
            case 0:
                // Display the product's name
                cell.textLabel?.text = "Name: \(product.name ?? "No Name")"
            case 1:
                // Display the product's description
                cell.textLabel?.text = "Description: \(product.productDescription ?? "No Description")"
            case 2:
                // Display the product's price
                cell.textLabel?.text = "Price: \(product.price)"
            case 3:
                // Display the product's price
                cell.textLabel?.text = "Provider: \(product.provider)"
            default:
                break
            }
            
            return cell
        }

    

    


}

