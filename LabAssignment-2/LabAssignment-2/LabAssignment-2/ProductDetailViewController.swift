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
        
        if let product = product {
            print("Product name: \(product.name)")
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

}
