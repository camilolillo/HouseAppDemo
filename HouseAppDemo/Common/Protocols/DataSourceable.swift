//
//  DataSourceable.swift
//

// MARK: - DataSourceable
protocol DataSourceable: AnyObject {
    associatedtype DataSourceType
    var dataSource: DataSourceType? { get set }
    func set(dataSource: DataSource)
}

extension DataSourceable {
    func set(dataSource: DataSource) { self.dataSource = dataSource as? DataSourceType }
}
