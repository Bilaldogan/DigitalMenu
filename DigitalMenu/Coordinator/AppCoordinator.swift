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
    
    weak var window: UIWindow?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let launchCoordinator = LaunchCoordinator(navigationController: self.navigationController)
        launchCoordinator.parentCoordinator = self
        self.childCoordinators.append(launchCoordinator)
        launchCoordinator.start()
    }

    func didFinisLaunch() {
        let splitVC = UISplitViewController()
        
        let homeCoordinator = HomeCoordinator(spiltViewController: splitVC)
        homeCoordinator.start()
        
        self.childCoordinators.append(homeCoordinator)
        window?.rootViewController = splitVC
        window?.makeKeyAndVisible()
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
