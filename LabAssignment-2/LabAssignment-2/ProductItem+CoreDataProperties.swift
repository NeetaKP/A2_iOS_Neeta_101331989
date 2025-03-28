//
//  ProductItem+CoreDataProperties.swift
//  LabAssignment-2
//
//  Created by Niko Pant on 2025-03-28.
//
//

import Foundation
import CoreData


extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productDescription: String?
    @NSManaged public var provider: String?

}

extension ProductItem : Identifiable {

}
