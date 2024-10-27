//
//  Stringable.swift
//

// MARK: - Stringable
protocol Stringable {
    var asString: String { get }
}

extension Stringable where Self: RawRepresentable, RawValue == String {
    var asString: String { rawValue }
}
