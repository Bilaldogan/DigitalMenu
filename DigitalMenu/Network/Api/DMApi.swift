//
//  DGApi.swift
//  DigitalMenu
//
//  Created by Bilal Doğan on 2.12.2019.
//  Copyright © 2019 Bilal Doğan. All rights reserved.
//

import Foundation
import Alamofire

enum DMEndPoint: String {
    //Mark: -EnpPointStrings
    case getItems = "GET /?s=allItems"
}

public class DMApi {
    
    public static let sharedInstance : DMApi = DMApi()
    private var sessionManager  = SessionManager()
    private var currentAccessToken      : String?
    
    private let baseUrl = "http://www.res.com"
    
    func call<T:Decodable>(endPoint: DMEndPoint,
                         parameters: [String : Any]? = nil,
                         encoding: ParameterEncoding = URLEncoding.default,
                         completionHandler: @escaping (Swift.Result<T, NetworkError>) -> Void){
        
        let endPoint = Endpoint.buildURL(baseURL: baseUrl,endPoint: endPoint.rawValue, values: parameters as? [String : AnyObject])
        print(endPoint)
        
        sessionManager.request(endPoint.URL.absoluteString!,
                               method: endPoint.method,
                               parameters: endPoint.otherValues,
                               encoding:encoding)
            .validate()
            .responseString { (response) in
                let result = response.result
                switch result {
                case .success(let value):
                    guard let data = value.data(using: .utf8) else {
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(T.self, from: data)
                        completionHandler(.success(decodedData))
                    } catch let jsonErr {
                        completionHandler(.failure(.invalidResponse))
                        print("Failed to serialize json:", jsonErr)
                    }
                    
                case .failure(let err):
                    if let networkError = err as? NetworkError {
                        completionHandler(.failure(networkError))
                    } else {
                        completionHandler(.failure(.unknown))
                    }
 
                }
        }
    }
    
}
   
