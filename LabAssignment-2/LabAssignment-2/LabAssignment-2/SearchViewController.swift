//
//  SearchViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-28.
//

import UIKit
import CoreData

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var name: String?
    var productDescr: String?
    
    // for search purpose
    var productSearch: [ProductItem] = []// for search purpose
    @IBOutlet weak var tableView: UITableView!
    
    var context: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //searchProducts()
        print("name: \(name!), Descr: \(productDescr!)")
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        performSearch(name: name!, productDescription: productDescr!)
    }
    
    func performSearch(name: String, productDescription: String) {
        // Create a fetch request for the 'Item' entity
        let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()
        print(">>Name: \(name), Descr: \(productDescription)")
        
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                let trimmedDescription = productDescription.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        var predicate: NSPredicate?

                if !trimmedName.isEmpty && !trimmedDescription.isEmpty {
                    // Search for both name and description
                    predicate = NSPredicate(format: "name CONTAINS[cd] %@ AND productDescription CONTAINS[cd] %@", trimmedName, trimmedDescription)
                } else if !trimmedName.isEmpty {
                    // Search only by name
                    predicate = NSPredicate(format: "name CONTAINS[cd] %@", trimmedName)
                } else if !trimmedDescription.isEmpty {
                    // Search only by description
                    predicate = NSPredicate(format: "productDescription CONTAINS[cd] %@", trimmedDescription)
                }
        
        // Set the predicate for the fetch request
        fetchRequest.predicate = predicate
        
        do {
            // Execute the fetch request
            productSearch = try context.fetch(fetchRequest)
            
            print("productSearch len: \(productSearch.count)")
            
            // Reload the table view with the results
            tableView.reloadData()

        } catch {
            print("Failed to fetch items: \(error)")
        }

    }

    
    // MARK: - Navigation

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return productSearch.count
        }
    
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            // font style for main text
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)

            // font color and size for - detailed text
            cell.detailTextLabel?.textColor = UIColor.black
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18)

            
            let item = productSearch[indexPath.row]
            cell.textLabel?.text = item.name ?? "No name available"
            cell.detailTextLabel?.text = "Description: \(item.productDescription ?? "No description available")"
            
            return cell
        }
}
