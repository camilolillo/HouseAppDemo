//
//  BaseClient.swift
//

import Alamofire

// MARK: - BaseClient
class BaseClient {
    internal var requests = [String: DataRequest]() {
        didSet {
            requests.forEach { print("\n\(Self.self).request: [\($0.key): \($0.value)]") }
        }
    }
}

// MARK: - ClientProtocol
extension BaseClient: ClientProtocol {}
