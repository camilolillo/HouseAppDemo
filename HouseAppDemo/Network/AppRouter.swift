//
//  AppRouter.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation
import Alamofire

// MARK: - AppRouter
enum AppRouter {
}

// MARK: - Endpoint
extension AppRouter: Endpoint {

    // MARK: - BaseURL
    var baseURL: URL? {
        switch self {
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        }
    }

    // MARK: - Headers
    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        switch self {
        }
        return headers
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        }
    }

    // MARK: - Parameters
    var parameters: Parameters {
        switch self {
        }
    }
}

// MARK: - URLRequestConvertible
extension AppRouter: URLRequestConvertible {}
