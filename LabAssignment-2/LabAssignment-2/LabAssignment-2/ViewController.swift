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
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewListButton: UIButton!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldDescription: UITextField!
    
    @IBOutlet weak var searchProductButton: UIButton!


    var product: ProductItem?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product = fetchFirstProduct()
            print("fetched product", product!.name ?? "n/a")
            print("fetched descr", product!
                .productDescription ?? "n/a")
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20

        
        tableView.dataSource = self
        tableView.delegate = self
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // for deleting items
        
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
            // We have 4 rows for product name, description, price, and provider
            return 4
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("aaa")
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            guard let product = product else { return cell }
                    
            switch indexPath.row {
            case 0:
                // Display the product's name
                // Create a mutable attributed string
                let attributedString = NSMutableAttributedString()

                // Append the bold "Name:" part
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
                let nameText = NSAttributedString(string: "Name: ", attributes: boldAttributes)
                attributedString.append(nameText)

                // Append the regular product name part
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16)
                ]
                let productName = NSAttributedString(string: product.name ?? "No Name", attributes: regularAttributes)
                attributedString.append(productName)
                
                cell.textLabel?.attributedText = attributedString
                
            case 1:
                // Display the product's description
                
                let attributedString = NSMutableAttributedString()

                // Append the bold "Name:" part
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
                let nameText = NSAttributedString(string: "Description: ", attributes: boldAttributes)
                attributedString.append(nameText)

                // Append the regular product name part
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16)
                ]
                let productName = NSAttributedString(string: product.productDescription ?? "No Description", attributes: regularAttributes)
                attributedString.append(productName)
                
                cell.textLabel?.attributedText = attributedString

            case 2:
                // Display the product's price
                let attributedString = NSMutableAttributedString()

                // Append the bold "Name:" part
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
                let nameText = NSAttributedString(string: "Price: ", attributes: boldAttributes)
                attributedString.append(nameText)

                // Append the regular product name part
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16)
                ]
                let productName = NSAttributedString(string: String(product.price), attributes: regularAttributes)
                attributedString.append(productName)
                
                cell.textLabel?.attributedText = attributedString

            case 3:
                // Display the product's provider
                let attributedString = NSMutableAttributedString()

                // Append the bold "Name:" part
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
                let nameText = NSAttributedString(string: "Provider: ", attributes: boldAttributes)
                attributedString.append(nameText)

                // Append the regular product name part
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16)
                ]
                let productName = NSAttributedString(string: product.provider ?? "No Provider", attributes: regularAttributes)
                attributedString.append(productName)
                
                cell.textLabel?.attributedText = attributedString

            default:
                break
            }
            
            return cell
        }

    
    @IBAction func searchButtonTapped(_ sender: Any) {
        if textFieldName.text?.isEmpty == true && textFieldDescription.text?.isEmpty == true {
            showAlert(message: "Please enter at least a name or description to search.")
        } else {
            moveToSearchView()
        }
        print("search button pressed")
        //deleteItemWithName(name: "n/a")
    }
    
    // Function to show alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func moveToSearchView(){
        // Get the values from the text fields
        guard let name = textFieldName.text, !name.isEmpty,
              let productDescr = textFieldDescription.text, !description.isEmpty else {
                    // Handle case where one of the fields is empty
                    return
                }
        
      
        if let searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController {
                    // Pass data to the next view controller
                    searchVC.name = name
                    searchVC.productDescr = productDescr
                    
                    // Push the view controller
                    navigationController?.pushViewController(searchVC, animated: true)
                }
    }
    
    // code for deleting data from core storage
    var context: NSManagedObjectContext!
    func deleteItemWithName(name: String) {
            // Create a fetch request for the 'Item' entity
            let fetchRequest: NSFetchRequest<ProductItem> = ProductItem.fetchRequest()

            // Create a predicate to filter by name
            let predicate = NSPredicate(format: "name == %@", name)
            fetchRequest.predicate = predicate

            do {
                // Perform the fetch request
                let items = try context.fetch(fetchRequest)

                // Delete all matching items
                for item in items {
                    context.delete(item)
                }

                // Save the context to persist changes
                try context.save()

                print("Item(s) deleted successfully.")
            } catch {
                print("Failed to delete item: \(error)")
            }
        }
    
         

}

