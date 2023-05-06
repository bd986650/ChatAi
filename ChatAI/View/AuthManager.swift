//
//  AuthManager.swift
//  ChatAI
//
//  Created by Jordyn Fulbright on 5/1/23.
//
import Foundation
import Combine
import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var shouldNavigate: Bool = false
    @Published var loginSuccess: Bool = false

    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                completion(error)
            } else {
                print("Logged in successfully")
                DispatchQueue.main.async {
                    self.loginSuccess = true
                }
                completion(nil)
            }
        }
    }
}

