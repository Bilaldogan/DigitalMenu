//
//  MenuNavigationVC.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 1.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit

final class CheckNavigationContoller: UINavigationController,CheckHeaderViewDelegate {
    
    private var headerView: CheckHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderView()
    }

    private func addHeaderView() {
        let headerView = CheckHeaderView(frame: .zero)
        headerView.backgroundColor = UIColor.black
        self.view.addSubview(headerView)
        headerView.delagate = self
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: self.navigationBar.frame.size.height).isActive = true
        self.headerView = headerView
    }
    
    func push(vc : UIViewController, checkNumber: String) {
        self.pushViewController(vc, animated: true)
        self.headerView.showDeatil(with: checkNumber)
    }
    
    func backTapped() {
        self.popViewController(animated: true)
    }
}

