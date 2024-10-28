//
//  SignOutUseCase.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 28-10-24.
//

import Foundation
import FirebaseAuth

protocol SignOutUseCaseProtocol {
    func execute(completion: @escaping (Bool, String) -> Void)
}

final class SignOutUseCase: SignOutUseCaseProtocol {
    func execute(completion: @escaping (Bool, String) -> Void) {
        do {
            try Auth.auth().signOut()
            clearUserDefaults()
            completion(true, .signOutSuccessMessage)
        } catch let signOutError as NSError {
            completion(false, signOutError.localizedDescription)
        }
    }
}

extension SignOutUseCase {
    private func clearUserDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
