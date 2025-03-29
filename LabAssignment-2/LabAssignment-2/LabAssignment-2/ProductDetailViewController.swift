//
//  ProductDetailViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-21.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var product: ProductItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print("aaa",product!.name)
        if let product = product {
            print("Product name: \(product.name ?? "No name") )")
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

}
