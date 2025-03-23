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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
