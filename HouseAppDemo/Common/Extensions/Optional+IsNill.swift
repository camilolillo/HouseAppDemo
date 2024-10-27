//
//  Optional+IsNil.swift
//

extension Optional {
    var isNil: Bool {
        switch self {
        case .none: return true
        case .some: return false
        }
    }
}
