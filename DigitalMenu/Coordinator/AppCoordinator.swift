//
//  AppCoornidator.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let launchCoordinator = LaunchCoordinator(navigationController: self.navigationController)
        launchCoordinator.parentCoordinator = self
        self.childCoordinators.append(launchCoordinator)
        launchCoordinator.start()
    }

    func didFinisLaunch() {
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
