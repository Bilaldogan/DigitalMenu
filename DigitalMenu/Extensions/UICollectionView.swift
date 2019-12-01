//
//  UICollectionView.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    public func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
    }
    
    public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        if Bundle.main.path(forResource: String(describing: name), ofType: "nib") != nil {
            let nib = UINib(nibName: String(describing: name), bundle: nil)
            register(nib, forCellWithReuseIdentifier: String(describing: name))
        } else {
            register(T.self, forCellWithReuseIdentifier: String(describing: name))
        }
        
    }
    
}
