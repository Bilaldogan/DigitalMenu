//
//  LauchVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit
import RealmSwift
final class LaunchVC: UIViewController {

    weak var coordinator: LaunchCoordinator?
    var api = MockMenuApi()
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }

    private func getItems() {
        api.getAllItems { (result) in
            switch result {
            case .success(let categories):
                let realm = try! Realm()
                try! realm.write() {
                    realm.deleteAll()
                    realm.add(categories)
                }
                self.finishLaunch()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func finishLaunch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.coordinator?.didFinisLaunch()
        }
    }
}
