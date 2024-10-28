//
//  RegisterUseCase.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol RegisterUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void)
}

final class RegisterUserUseCase: RegisterUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard let firebaseUser = authResult?.user, let userEmail = firebaseUser.email else {
                completion(false, "Hubo un problema con el registro.")
                return
            }
            
            
            let userModel = User(
                uid: firebaseUser.uid,
                email: userEmail,
                name: firebaseUser.displayName,
                photoURL: firebaseUser.photoURL
            )
            
            let databaseRef = Database.database().reference()
            let userRef = databaseRef.child("users").child(userModel.uid)
            
            userRef.setValue(userModel.toDictionary()) { error, _ in
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    completion(true, "Usuario registrado exitosamente")
                }
            }
        }
    }
}

