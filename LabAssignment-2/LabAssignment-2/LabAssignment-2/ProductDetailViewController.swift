//
//  ProductDetailViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-21.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var product: ProductItem?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if let product = product {
            print(">>>Product name: \(product.name ?? "No name") )")
        }else{
            print("invalid product") // few statments added for debugging
        }
    }
    
    // MARK: - Navigation

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("aaa")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let product = product else { return cell }

        switch indexPath.row {
        case 0:
        // display product name
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
            // Display the product's price
            
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

}
