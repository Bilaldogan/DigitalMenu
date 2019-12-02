//
//  MenuApi.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation

protocol MenuApiProtocol {
    func getAllItems(completion: @escaping (Swift.Result<[Category], NetworkError>) -> Void)
}

extension MenuApiProtocol {
    var api: DMApi {
        return DMApi.sharedInstance
    }
}
