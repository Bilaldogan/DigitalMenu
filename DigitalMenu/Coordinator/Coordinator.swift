//
//  Coordinator.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
