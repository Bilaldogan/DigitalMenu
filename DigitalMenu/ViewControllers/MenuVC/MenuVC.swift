//
//  MenuVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var menuItemsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(cellWithClass: CategoryCollectionViewCell.self)
        subCategoryCollectionView.register(cellWithClass: SubCategoryCollectionViewCell.self)
        menuItemsCollectionView.register(cellWithClass: MenuItemCollectionViewCell.self)
        categoryCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }

}

extension MenuVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == subCategoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withClass: SubCategoryCollectionViewCell.self, for: indexPath)
            return cell
        } else if collectionView == menuItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withClass: MenuItemCollectionViewCell.self, for: indexPath)
                       return cell
        }
        let cell = collectionView.dequeueReusableCell(withClass: CategoryCollectionViewCell.self, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuItemsCollectionView {
            let width = menuItemsCollectionView.frame.width / 5
            return CGSize(width: width, height: width)
        }
        return CGSize(width: "asdfas".size(withAttributes: [.font: UIFont.systemFont(ofSize: 42)]).width, height: collectionView.frame.height)
    }
}
