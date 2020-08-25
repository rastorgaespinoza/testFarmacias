//
//  ApiConfiguration.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Alamofire
import Foundation

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
