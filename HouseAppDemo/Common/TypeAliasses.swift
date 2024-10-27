//
//  TypeAliases.swift
//

// MARK: - Handlers
typealias CompletionHandler = (() -> Void)?
typealias Handler<T> = (T) -> Void
typealias ResultHandler<T> = Handler<Result<T, Error>>
typealias CustomErrorResultHandler<T, E: Error> = Handler<Result<T, E>>

// MARK: - UIKit related
typealias DataSourceableCell = BaseCell & DataSourceable
