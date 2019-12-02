//
//  CheckVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class CheckVC: UIViewController {

    weak var coordinator: CheckCoordinator?
    
    @IBOutlet weak var checkListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkListTableView.register(cellWithClass: CheckTableViewCell.self)
    }

}

extension CheckVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CheckTableViewCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.openDetail(with: "")
    }
}
