//
//  PharmaciesGobEndpoint.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 25-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation
import Alamofire

enum PharmaciesGobEndpoint: APIConfiguration {
    
    case getPharmaciesByPharmacy(pharmacy: String)
    case getPharmaciesByLimit(limit: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getPharmaciesByPharmacy, .getPharmaciesByLimit:
            return .get
        }
    }
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .getPharmaciesByPharmacy(pharmacy: let pharmacy):
            return .url(["q":pharmacy, "resource_id": "a60f93af-6a8a-45b6-85ff-267f5dd37ad6"])
        case .getPharmaciesByLimit(limit: let limit):
            return .url(["limit":limit, "resource_id": "a60f93af-6a8a-45b6-85ff-267f5dd37ad6"])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getPharmaciesByPharmacy, .getPharmaciesByLimit:
            return Constants.ProductionServerGob.pathSearch
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServerGob.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
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
