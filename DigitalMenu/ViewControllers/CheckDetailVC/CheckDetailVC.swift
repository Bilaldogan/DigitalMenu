//
//  CheckDetailVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit
import RealmSwift
class CheckDetailVC: UIViewController {
    
    weak var coordinator: CheckCoordinator?

    @IBOutlet weak var checkDetailTableView: UITableView!
    
    var check: CheckItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkDetailTableView.register(cellWithClass: CheckItemTableViewCell.self)
        updateCheck()
        // Do any additional setup after loading the view.
    }
    
    private func updateCheck() {
        let realm = try! Realm()
            try! realm.write {
                realm.add(self.check, update: .modified)
        }
    }
    
    @IBAction func payCheck(_ sender: Any) {
        let realm = try! Realm()
            try! realm.write {
                realm.delete(self.check)
                coordinator?.pop()
        }
    }
}

extension CheckDetailVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return check.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CheckItemTableViewCell.self, for: indexPath)
        cell.configure(with: check.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try! Realm()
                try! realm.write {
                    check.items.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension CheckDetailVC: MenuItemAcceptable {
    func add(menuItem: MenuItem) {
        let realm = try! Realm()
            try! realm.write {
                self.check.items.append(menuItem)
                checkDetailTableView.reloadData()
        }
    }
    
}
