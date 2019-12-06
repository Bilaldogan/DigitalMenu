//
//  CheckVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit
import RealmSwift
class CheckVC: UIViewController {

    weak var coordinator: CheckCoordinator?
     
    var cheklist: Results<CheckItem>?
    var token: NotificationToken?
    
    @IBOutlet weak var checkListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkListTableView.register(cellWithClass: CheckTableViewCell.self)
        addRealmObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkListTableView.reloadData()
    }
    
    func addRealmObserver() {
        let realm = try! Realm()
        self.cheklist = realm.objects(CheckItem.self)
        self.token = self.cheklist?.observe({ [weak self] (changes) in
            self?.cheklist = realm.objects(CheckItem.self)
            self?.checkListTableView.reloadData()
        })
    }
    
}

extension CheckVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cheklist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CheckTableViewCell.self, for: indexPath)
        cell.configure(with: cheklist![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCheck = cheklist![indexPath.row]
        coordinator?.openDetail(with: selectedCheck)
    }
}

extension CheckVC: MenuItemAcceptable {
    
    func add(menuItem: MenuItem) {
        let newCheck = CheckItem()
        if cheklist?.count ?? 0 > 0 {
            let lastCheck = (cheklist?.last)!
            newCheck.id = lastCheck.id + 1
        }
        let realm = try! Realm()
        try! realm.write {
            newCheck.items.append(menuItem)
            realm.add(newCheck)
            checkListTableView.reloadData()
        }
        coordinator?.openDetail(with: newCheck)
    }
    
}
