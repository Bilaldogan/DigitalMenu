//
//  MenuController.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class MenuCoordinator: Coordinator {
    
    var parentCoordinator: HomeCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let vc = MenuVC()
        vc.view.backgroundColor = .blue
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    func didSelect(menuItem: MenuItem) {
        parentCoordinator?.addItemToCheck(item: menuItem)
    }
    
}
