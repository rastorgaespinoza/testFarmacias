//
//  PharmaciesEndpoint.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation
import Alamofire

enum PharmaciesEndpoint: APIConfiguration {
    
    case getPharmacies
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getPharmacies:
            return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .getPharmacies:
            return .url([:])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getPharmacies:
            return "/index.php/ws/getLocales"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServerMinsal.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
//        urlRequest.setValue("b32f1315bae0ada454480368f64206d6", forHTTPHeaderField: "user-key")
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
        }
            return urlRequest
    }
}
