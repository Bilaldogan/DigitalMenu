//
//  CheckItemTableViewCell.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 6.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class CheckItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: MenuItem) {
        self.itemNameLabel.text = item.name
        self.priceLabel.text = String(item.price)
    }
    
}
