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
        let productInfo = Produc(id: UUID(), name: name, productDescription: description, price: price, provider: provider)
        
        saveProductToCoreData(product: productInfo);
        
        clearInputFields();
        }
    
    func saveProductToCoreData(product: Produc){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.managedObjectContext
        
        let newProductItem = ProductItem(context: context)
        newProductItem.id = product.id
        newProductItem.name = product.name
        newProductItem.productDescription = product.productDescription
        newProductItem.price = product.price
        newProductItem.provider = product.provider
        
        do{
            try context.save()
            showAlert(message: "New product saved successfully")
        } catch {
            showAlert(message: "Error saving product")
        }

    }
        
        // Function to show alerts
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
    func clearInputFields(){
        editTextName.text = ""
        editTextDescription.text = ""
        editTextPrice.text = ""
        editTextProvider.text = ""
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
