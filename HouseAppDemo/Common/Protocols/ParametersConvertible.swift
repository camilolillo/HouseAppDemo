//
//  ParametersConvertible.swift
//

import Alamofire

// MARK: - ParametersConvertible
protocol ParametersConvertible {
    var asParameters: Parameters { get }
}
