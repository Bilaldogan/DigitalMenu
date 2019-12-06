//
//  CheckIItem.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 6.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import RealmSwift
class CheckItem: Object,Decodable {
    @objc dynamic var id = 100
    var items = List<MenuItem>()
    var totalPrice: Double{
        return getTotalPrice()
    }
    
    private func getTotalPrice() -> Double {
        var totalPrice = 0.0
        for item in items {
            totalPrice += item.price
        }
        return totalPrice
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
