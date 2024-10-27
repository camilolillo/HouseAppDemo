//
//  CollectionViewSizeable.swift
//

// MARK: - CollectionViewSizeable
protocol CollectionViewSizeable: AnyObject {
    func onSizeForHeaderItem(in section: Int) -> (width: Double, height: Double)
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double)
}

extension CollectionViewSizeable {
    func onSizeForHeaderItem(in section: Int) -> (width: Double, height: Double) { (.zero, .zero) }
}
