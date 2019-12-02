//
//  Category.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import RealmSwift

class Category: Object,Decodable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    var subCategories = List<SubCategory>()
}
