//
//  MockMenuApi.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation

class MockMenuApi: MenuApiProtocol {
    func getAllItems(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        completion(.success(getTestData()))
    }
    
    private func getTestData() -> [Category] {
        guard let jsonPath = Bundle.main.path(forResource: "TestData", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                return [Category]()
        }
        let categories = try! JSONDecoder().decode([Category].self, from: jsonData)
        return categories
    }
}
