//
//  AppEnvironment.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

// MARK: - APIEnvironment
enum AppEnvironment { }

extension AppEnvironment {
    static var baseURLAsString: String { "" }
    static var baseURL: URL? { .init(string: baseURLAsString) }
}
