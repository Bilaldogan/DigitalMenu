//
//  NetworkError.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unknown
    case invalidResponse
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "An unknown error occured"
        case .invalidResponse:
            return "Recevied an Invalid response"
        }
    }
}
