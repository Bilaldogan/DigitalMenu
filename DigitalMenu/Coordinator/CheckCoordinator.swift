//
//  CheckCoordinator.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class CheckCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: CheckNavigationContoller
    
    init(navigationController: CheckNavigationContoller) {
        self.navigationController = navigationController
    }
    
    func start() {
        let checkVC = CheckVC()
        checkVC.coordinator = self
        self.navigationController.pushViewController(checkVC, animated:false)
    }
    
    func openDetail(with check: CheckItem) {
        let checkDetailVC = CheckDetailVC()
        checkDetailVC.coordinator = self
        checkDetailVC.check = check
        self.navigationController.push(vc: checkDetailVC, checkNumber: String(check.id))
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
    
}

extension CheckCoordinator: MenuItemAcceptable {
    func add(menuItem: MenuItem) {
        if let vc = self.navigationController.topViewController as? MenuItemAcceptable {
            vc.add(menuItem: menuItem)
        }
    }
}

protocol MenuItemAcceptable {
    func add(menuItem: MenuItem)
}
