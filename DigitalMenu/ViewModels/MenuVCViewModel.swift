//
//  MenuVCVieModel.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 3.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation
import RealmSwift

class MenuVCViewModel {
    
    var categories = [Category]()
    var filteredSubCategories = [SubCategory]()
    var filteredItems = [MenuItem]()
    
    var updated: (()->())?
    
    init() {
        do {
            let realm = try Realm()
            self.categories = realm.objects(Category.self).filter({_ in true})
            reloadData()
        } catch _ {
            // handle error
        }
    }
    
    private func reloadData() {
        for category in categories {
            for subCategory in category.subCategories {
                filteredSubCategories.append(subCategory)
                for item in subCategory.items {
                    self.filteredItems.append(item)
                }
            }
        }
    }
    
    func clearFilters() {
        reloadData()
        updated?()
    }
    
    func filterCategory(in index: Int) {
        self.filteredSubCategories = self.categories[index].subCategories.filter({_ in true})
        updated?()
    }
    
    func filterSubCategory(in index: Int) {
        self.filteredItems = self.filteredSubCategories[index].items.filter({_ in true})
        updated?()
    }
    
    func menuItem(at index: Int) -> MenuItem{
        return self.filteredItems[index]
    }
    
    
}
