//
//  ClientProtocol.swift
//

import Alamofire

// MARK: - ClientProtocol
protocol ClientProtocol: AnyObject {
    var requests: [String: DataRequest] { get set }
    func request<T: Decodable>(from function: String, resource: URLRequestConvertible, result: @escaping ResultHandler<T>)
}

// MARK: - Default Implementation
extension ClientProtocol {
    func request<T: Decodable>(from function: String = #function, resource: URLRequestConvertible, result: @escaping ResultHandler<T>) {
        requests[function]?.cancel()
        requests[function] = HTTPService.request(resource: resource, result: result)
    }
}
