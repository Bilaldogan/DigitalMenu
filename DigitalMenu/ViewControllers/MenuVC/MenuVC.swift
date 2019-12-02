//
//  MenuVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

final class MenuVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var menuItemsCollectionView: UICollectionView!
    
    var viewModel = MenuVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(cellWithClass: CategoryCollectionViewCell.self)
        subCategoryCollectionView.register(cellWithClass: SubCategoryCollectionViewCell.self)
        menuItemsCollectionView.register(cellWithClass: MenuItemCollectionViewCell.self)
        viewModel.updated = { [unowned self] in
            self.reloadCollectionViews()
        }
    }
    
    private func reloadCollectionViews() {
        var selectedIndexPaths = self.categoryCollectionView.indexPathsForSelectedItems
        self.categoryCollectionView.reloadData()
        for indexPath in selectedIndexPaths ?? [IndexPath](){
            self.categoryCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        }
        selectedIndexPaths = self.subCategoryCollectionView.indexPathsForSelectedItems
        self.subCategoryCollectionView.reloadData()
        for indexPath in selectedIndexPaths ?? [IndexPath](){
            self.subCategoryCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        }
        selectedIndexPaths = self.menuItemsCollectionView.indexPathsForSelectedItems
        self.menuItemsCollectionView.reloadData()
        for indexPath in selectedIndexPaths ?? [IndexPath](){
            self.menuItemsCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        }
    }
    
}

extension MenuVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return viewModel.categories.count
        case subCategoryCollectionView:
            return viewModel.filteredSubCategories.count
        case menuItemsCollectionView:
            return viewModel.filteredItems.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withClass: CategoryCollectionViewCell.self, for: indexPath)
            cell.configure(with: viewModel.categories[indexPath.row])
            return cell
            
        case subCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withClass: SubCategoryCollectionViewCell.self, for: indexPath)
            cell.configure(with: viewModel.filteredSubCategories[indexPath.row])
            return cell
        case menuItemsCollectionView:
            let cell = collectionView.dequeueReusableCell(withClass: MenuItemCollectionViewCell.self, for: indexPath)
            cell.configure(with: viewModel.filteredItems[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case categoryCollectionView:
            let width = viewModel.categories[indexPath.row].name.size(withAttributes: [.font: UIFont.systemFont(ofSize: 40)]).width
            return CGSize(width: width + 32, height: collectionView.frame.height)
            
        case subCategoryCollectionView:
            let width = viewModel.filteredSubCategories[indexPath.row].name.size(withAttributes: [.font: UIFont.systemFont(ofSize: 30)]).width
            return CGSize(width: width + 40, height: collectionView.frame.height)
        case menuItemsCollectionView:
            let width = (menuItemsCollectionView.frame.width - 40) / 5
            return CGSize(width: width, height: width)
        default:
            return CGSize.zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            viewModel.filterCategory(in: indexPath.row)
        case subCategoryCollectionView:
            viewModel.filterSubCategory(in: indexPath.row)
        default:break
        }
        reloadCollectionViews()
    }
}
