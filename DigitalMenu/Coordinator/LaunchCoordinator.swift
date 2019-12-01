//
//  LaunchCoordinator.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class LaunchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let launchVC = LaunchVC()
        launchVC.view.backgroundColor = .yellow
        self.navigationController.pushViewController(launchVC, animated: false)
    }
    
    func didFinisLaunch() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.didFinisLaunch()
    }
    
}
