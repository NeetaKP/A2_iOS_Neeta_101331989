//
//  AddProductViewController.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-22.
//

import UIKit
import CoreData

class AddProductViewController:
    UIViewController {
    var prodItem:Produc?

    @IBOutlet weak var editTextName: UITextField!
    
    @IBOutlet weak var editTextDescription: UITextField!
    
    @IBOutlet weak var editTextPrice: UITextField!
    
    @IBOutlet weak var editTextProvider: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveProductButton(_ sender: Any) {
        saveProductInformation();
    }
    
    
    func saveProductInformation() {
        guard let name = editTextName.text, !name.isEmpty else {
                showAlert(message: "Name is required.")
                return
            }
        
        guard let description = editTextDescription.text, !description.isEmpty else {
                showAlert(message: "Description is required.")
                return
            }
        guard let priceText = editTextPrice.text, let price = Double(priceText), price > 0 else {
                showAlert(message: "Please enter a valid price.")
                return
            }
        guard let provider = editTextProvider.text, !provider.isEmpty else {
                showAlert(message: "Provider is required.")
                return
            }
            
            // Save the product info (You can save this to a database, file, etc.)
            let productInfo = Produc(name: name, productDescription: description, price: price, provider: provider)
            
            // Optionally, you can print it or save to a persistent storage
            print("Product Info Saved: \(productInfo)")
            
            // Show a success message
            showAlert(message: "Product information saved successfully!")
        }
        
        // Function to show alerts
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
