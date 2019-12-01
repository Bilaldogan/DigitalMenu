//
//  SubCategoryCollectionViewCell.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            refreshState()
        }
    }
    
    private func refreshState() {
        if isSelected {
            self.categoryTitleLabel.textColor = UIColor.white
            self.containerView.backgroundColor = UIColor.orange
        } else {
            self.categoryTitleLabel.textColor = UIColor.black
            self.containerView.backgroundColor = UIColor.white
        }
    }

}
