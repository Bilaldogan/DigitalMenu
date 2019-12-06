//
//  CheckTableViewCell.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with checkItem: CheckItem) {
        self.checkNumberLabel.text = "Check Number: " + String(checkItem.id)
        self.priceLabel.text = String(checkItem.totalPrice)
    }
    
}
