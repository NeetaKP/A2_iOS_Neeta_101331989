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
        
        //productSearch.append(ProductItem(name: name, productDescr:productDescr, price: 33.33, provider:"ABC"))

        // Do any additional setup after loading the view.
        
        //table2View.register(UITableViewCell.self, forCellReuseIdentifier: "SearchCell")
        //table2View.rowHeight = UITableView.automaticDimension
        //table2View.estimatedRowHeight = 20

        tableView.delegate = self
        tableView.dataSource = self
        
        //searchProducts()
        print("name: \(name!), Descr: \(productDescr!)")
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //tableView.reloadData()
        
        performSearch(name: name!, productDescription: productDescr!)
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        

    }
    func performSearch(name: String, productDescription: String) {
        // Create a fetch request for the 'Item' entity
        let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()
        print(">>Name: \(name), Descr: \(productDescription)")
        // Create predicate to filter by name and productDescr
        //let predicate = NSPredicate(format: "name == %@ AND productDescription == %@", name, productDescription)
        
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
            print("name: \(productSearch[0].name), Descr: \(productSearch[0].productDescription), Price: \(productSearch[0].price), Provider: \(productSearch[0].provider)")
            
            // Reload the table view with the results

            tableView.reloadData()

        } catch {
            print("Failed to fetch items: \(error)")
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
            return productSearch.count
        }
    
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            // font style for name 
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)

            
            let item = productSearch[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "Description: \(item.productDescription ?? "No description available")"
            
            return cell
        }
    


}
