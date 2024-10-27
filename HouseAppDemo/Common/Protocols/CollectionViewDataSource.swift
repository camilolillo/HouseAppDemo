//
//  CollectionViewDataSourceable.swift
//

// MARK: - CollectionViewDataSourceable
protocol CollectionViewDataSourceable: AnyObject {
    func getNumberOfSections() -> Int
    func getNumberOfItems(in section: Int) -> Int
    func onCellForItem(in section: Int, at index: Int) -> DataSource?
    func onHeaderItemDataSourceRequested(in section: Int) -> DataSource?
    func onHeaderItemReuseIdentifierRequested(in section: Int) -> String
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String
}

// MARK: - Default implementation
extension CollectionViewDataSourceable {
    func getNumberOfSections() -> Int { 1 }
    func onHeaderItemDataSourceRequested(in section: Int) -> DataSource? { nil }
    func onHeaderItemReuseIdentifierRequested(in section: Int) -> String { .empty }
}
