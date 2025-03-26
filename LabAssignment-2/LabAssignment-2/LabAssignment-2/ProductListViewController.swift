//
//  ProductListViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-25.
//

import UIKit
import CoreData

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [ProductItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        

        
        fetchProducts()
    }
/*
    func fetchProducts() {
          // Create a fetch request for the ProductItem
          let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()
          
          // Get the managed object context
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
          let context = appDelegate.managedObjectContext
          
          do {
              // Perform the fetch request and get the results
              products = try context.fetch(fetchRequest)
              tableView.reloadData()
          } catch {
              print("Failed to fetch products: \(error)")
          }
      }
*/
    func fetchProducts() {
        products = fetchProductsFromCoreData()
        tableView.reloadData()
    }
    
    func fetchProductsFromCoreData() -> [ProductItem]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.managedObjectContext
        
        let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()
        
        do {
            let fetchedProducts = try context.fetch(fetchRequest)
            return fetchedProducts
        } catch {
            print("Failed to fetch product items: \(error)")
            return []
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.detailTextLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)

        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "Description: \(product.productDescription ?? "No description available")"
        
        
        return cell
    }
    
    func tableview(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("Detail button tapped for product: \(product.name!)")
        
        let detailVC = ProductDetailViewController()
        
        detailVC.product! = product
        navigationController?.pushViewController(detailVC, animated:true)
    }



}
