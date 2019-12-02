//
//  CheckDetailVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

class CheckDetailVC: UIViewController {
    
    weak var coordinator: CheckCoordinator?

    @IBOutlet weak var checkDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDetailTableView.register(cellWithClass: CheckTableViewCell.self)
        // Do any additional setup after loading the view.
    }

}

extension CheckDetailVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CheckTableViewCell.self, for: indexPath)
        return cell
    }
    
    
}
