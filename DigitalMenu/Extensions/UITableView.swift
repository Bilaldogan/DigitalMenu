//
//  UITableView.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

extension UITableView {
    
    final func register<T: UITableViewCell>(nib: UINib?, forCellWithClass name: T.Type){
        register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    final public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        if Bundle.main.path(forResource: String(describing: name), ofType: "nib") != nil {
            let nib = UINib(nibName: String(describing: name), bundle: nil)
            register(nib, forCellReuseIdentifier: String(describing: name))
        } else {
            register(T.self, forCellReuseIdentifier: String(describing: name))
        }
        
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
                   fatalError("Couldn't find UICollectionViewCell for \(String(describing: name))")
        }
        return cell
        
    }
}
