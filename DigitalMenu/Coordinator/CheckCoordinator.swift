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
    
    func openDetail(with check: String) {
        let checkDetailVC = CheckDetailVC()
        checkDetailVC.coordinator = self
        self.navigationController.pushViewController(checkDetailVC, animated: true)
    }
    
}
