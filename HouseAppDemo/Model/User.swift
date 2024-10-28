//
//  User.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 28-10-24.
//

import Foundation

struct User: Codable {
    var uid: String
    var email: String
    var name: String?
    var photoURL: URL?
    
    init(uid: String, email: String, name: String?, photoURL: URL?) {
        self.uid = uid
        self.email = email
        self.name = name
        self.photoURL = photoURL
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "uid": uid,
            "email": email,
            "name": name ?? "",
            "photoURL": photoURL?.absoluteString ?? ""
        ]
    }
}
