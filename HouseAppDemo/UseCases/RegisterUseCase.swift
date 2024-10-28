//
//  RegisterUseCase.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import FirebaseAuth

protocol RegisterUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void)
}

final class RegisterUserUseCase: RegisterUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(
            withEmail: email,
            password: password) { authResult, error in
                if let error = error {
                    completion(false, error.localizedDescription)
                    return
                }
                completion(true, "User registered successfully")
        }
    }
}


