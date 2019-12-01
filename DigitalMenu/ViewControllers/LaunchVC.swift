//
//  LauchVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

final class LaunchVC: UIViewController {

    weak var coordinator: LaunchCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       finishLaunch()
    }

    private func finishLaunch() {
        #warning("load test data here")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.didFinisLaunch()
        }
    }
}
