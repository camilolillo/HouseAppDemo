//
//  CollectionViewDelegateable.swift
//

// MARK: - CollectionViewDelegateable
protocol CollectionViewDelegateable: AnyObject {
    func onItemSelected(in section: Int, at index: Int)
}

extension CollectionViewDelegateable {
    func onItemSelected(in section: Int, at index: Int) {}
}

