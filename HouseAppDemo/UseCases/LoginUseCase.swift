//
//  LoginUseCase.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol LoginUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void)
}

final class LoginUserUseCase: LoginUserUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard let firebaseUser = authResult?.user else {
                completion(false, "No se pudo obtener el usuario de Firebase.")
                return
            }
            
            let databaseRef = Database.database().reference()
            let userRef = databaseRef.child("users").child(firebaseUser.uid)
            
            userRef.observeSingleEvent(of: .value) { snapshot in
                guard let userData = snapshot.value as? [String: Any],
                      let email = userData["email"] as? String else {
                    completion(false, "No se pudo obtener la información del usuario.")
                    return
                }
                
                let name = userData["name"] as? String
                let photoURLString = userData["photoURL"] as? String
                let photoURL = photoURLString != nil ? URL(string: photoURLString!) : nil
                
                let user = User(uid: firebaseUser.uid, email: email, name: name, photoURL: photoURL)
                
                self.saveUserToUserDefaults(user)
                completion(true, "Login exitoso")
            }
            
        }
    }
    
}

extension LoginUserUseCase {
    private func saveUserToUserDefaults(_ user: User) {
        let defaults = UserDefaults.standard
        if let encodedUser = try? JSONEncoder().encode(user) {
            defaults.set(encodedUser, forKey: "currentUser")
        }
    }
}
