//
//  Array+Coordinator.swift
//

// MARK: - Array convenience Extension
extension Array where Element == Coordinator {
    func getFirst<T: Coordinator>(of type: T.Type) -> T? { first { $0 is T } as? T }

    mutating func removeAll<T: Coordinator>(of type: T.Type) {
        guard getFirst(of: T.self).isNotNil else { return }
        removeAll { $0 is T }
    }
}
