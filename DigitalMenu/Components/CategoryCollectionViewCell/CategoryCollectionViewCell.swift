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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTitleLabel()
    }
    
    override var isSelected: Bool {
        didSet {
            refreshState()
        }
    }
    
    func configure(with item: Category) {
        self.categoryTitleLabel.text = item.name
    }
    
    private func addTitleLabel() {
                
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "asdfas"
        label.textAlignment = .center
        self.contentView.addSubview(label)
        label.autoPinEdgesToSuperview()
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
