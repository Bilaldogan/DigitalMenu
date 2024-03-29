//
//  MenuItem.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import RealmSwift

class MenuItem: Object,Decodable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var price : Double = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
