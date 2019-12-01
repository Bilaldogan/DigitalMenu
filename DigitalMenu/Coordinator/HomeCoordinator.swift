//
//  HomeCoordinator.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var splitViewController: UISplitViewController
    
    init(spiltViewController: UISplitViewController) {
        self.splitViewController = spiltViewController
    }
    
    func start() {
        
        let checkNavController = UINavigationController()
        let menuNavController = UINavigationController()
        
        let checkCoordinator = CheckCoordinator(navigationController: checkNavController)
        checkCoordinator.start()
        self.childCoordinators.append(checkCoordinator)
        
        let menuCoordinator = MenuCoordinator(navigationController: menuNavController)
        menuCoordinator.start()
        self.childCoordinators.append(menuCoordinator)
        
        self.splitViewController.preferredDisplayMode = .allVisible
        self.splitViewController.preferredPrimaryColumnWidthFraction = 1/3
        self.splitViewController.viewControllers = [checkNavController,menuNavController]
        
    }
    
    
}
