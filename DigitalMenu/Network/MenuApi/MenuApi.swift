//
//  MenuApi.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation

class MenuApi: MenuApiProtocol {
    func getAllItems(completion: @escaping (Swift.Result<[Category], NetworkError>) -> Void) {
        api.call(endPoint: .getItems, parameters: nil, completionHandler: completion)
    }
    
    
}
