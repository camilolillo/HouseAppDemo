//
//  Endpoint.swift
//

import Alamofire

// MARK: - Endpoint
protocol Endpoint {
    var baseURL: URL? { get }
    var servicePath: String { get }
    var path: String { get }
    var url: URL? { get }
    var headers: HTTPHeaders { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
}

// MARK: - Default Implementation
extension Endpoint {
    var servicePath: String { .empty }
    var url: URL? { baseURL?.appendingPathComponent("\(servicePath)\(path)") }
}

// MARK: - where Self: URLRequestConvertible
extension Endpoint where Self: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        guard let url = url else { return .init(url: URL(string: .empty)!) }

        var urlRequest = URLRequest(url: url)

        defer {
            print("Endpoint: \(Self.self)")
            print("URL: \(urlRequest)")
            print("Headers: \(String(describing: urlRequest.allHTTPHeaderFields ?? [:]))\n")
        }

        // MARK: - Headers
        urlRequest.headers = headers


        // MARK: - HTTPMethod
        urlRequest.httpMethod = method.rawValue


        // MARK: - Parameters Encoding
        switch method {
        case .get: return try URLEncoding.default.encode(urlRequest, with: parameters)
        default: return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
