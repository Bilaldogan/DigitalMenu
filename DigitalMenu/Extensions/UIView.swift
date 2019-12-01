
//
//  File.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

extension UIView {
    
    func autoPinEdgesToSuperview(with offset: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: offset).isActive = true
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: offset).isActive = true
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -offset).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: -offset).isActive = true

    }
    
    func autoCenterToSuperView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
    }
}
