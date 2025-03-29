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

        //self.view.backgroundColor = UIColor.white
        
        //tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //tableView.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
        // Do any additional setup after loading the view.
        //print("aaa",product!.name)
        if let product = product {
            print(">>>Product name: \(product.name ?? "No name") )")
        }else{
            print("invalid product") // few statments added for debugging
        }
        //updateUI()
    }
    
    /*
    func updateUI() {
            guard let product = product else { return }
            
            //nameLabel.text = product.name
            //descriptionLabel.text = product.description ?? "No description available"
            //priceLabel.text = "Price: \(product.price)"
            //providerLabel.text = "Provider: \(product.provider ?? "Unknown")"
        }
        
        @IBAction func dismissButtonTapped(_ sender: UIButton) {
            // Dismiss the modal view (optional)
            dismiss(animated: true, completion: nil)
        }
     */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            
            //cell.textLabel?.text = "Name: \(product.name ?? "No Name")"

        case 1:
            // Display the product's description
            /*
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
             */
            cell.textLabel?.text = "Description: \(product.productDescription ?? "No Description")"
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
             
            //cell.textLabel?.text = "Price: \(product.price)"
        case 3:
            // Display the product's price
            /*
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
             */
            cell.textLabel?.text = "Provider: \(product.provider)"
        default:
            break
        }

        return cell
    }

}
