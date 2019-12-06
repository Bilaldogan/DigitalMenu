//
//  CheckHeaderView.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import UIKit
protocol CheckHeaderViewDelegate:NSObject {
    func backTapped()
}
class CheckHeaderView: UIView {
    
    weak var delagate: CheckHeaderViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var personButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named:"person"), for: .normal)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.isHidden = true
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var checkNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addStackView()
        fillStackView()
    }
    
    private func addStackView() {
        self.addSubview(stackView)
        stackView.autoPinEdgesToSuperview(with: 8)
    }
    
    private func fillStackView() {
        self.stackView.addArrangedSubview(closeButton)
        self.stackView.addArrangedSubview(checkNumberLabel)
        self.stackView.addArrangedSubview(personButton)
        self.stackView.addArrangedSubview(UIView(frame:.zero))
    }
    
    func showDeatil(with checkNumber: String){
        UIView.animate(withDuration: 0.5) {
            self.checkNumberLabel.isHidden = false
            self.checkNumberLabel.text = checkNumber
            self.closeButton.isHidden = false
        }
    }
    
    func showInitialState() {
        UIView.animate(withDuration: 0.5) {
            self.checkNumberLabel.isHidden = false
            self.closeButton.isHidden = false
        }
    }
    
    @objc func backTapped() {
        self.delagate?.backTapped()
        showInitialState()
    }
}
