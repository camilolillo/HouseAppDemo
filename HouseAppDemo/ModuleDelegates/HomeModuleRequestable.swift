//
//  HomeModuleRequestable.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 28-10-24.
//

protocol HomeModuleRequestable: AnyObject {
    func onHomeModuleRequested(with user: User)
}
