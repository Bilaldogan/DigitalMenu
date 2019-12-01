//
//  CategoryCollectionViewCell.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addTitleLabel()
    }
    
    override var isSelected: Bool {
        didSet {
            refreshState()
        }
    }
    
    private func addTitleLabel() {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        self.addSubview(label)
        label.autoPinEdgesToSuperview(with: 8)
        self.categoryTitleLabel = label
    }
    
    private func refreshState() {
        if isSelected {
            self.categoryTitleLabel.textColor = UIColor.yellow
        } else {
            self.categoryTitleLabel.textColor = UIColor.darkGray
        }
    }
    
}
