//
//  LauchVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit
import Realm
final class LaunchVC: UIViewController {

    weak var coordinator: LaunchCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       finishLaunch()
    }

    private func finishLaunch() {
        #warning("load test data here")
        guard let jsonPath = Bundle.main.path(forResource: "TestData", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.didFinisLaunch()
        }
    }
}
