//
//  DataManager.swift
//  ChatAI
//
//  Created by Aniyah Norman on 4/26/23.
//
import Firebase
import SwiftUI

import FirebaseFirestore
import FirebaseFirestoreSwift
//
class DataManager: ObservableObject {
    @Published var users: [User] = [
                                    User(id: "1", name: "name", email: "email", businessName: "dairy")
                                    ]
    
    init () {
        fetchUsers()
    }
    
    func fetchUsers() {
        users.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["ID"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let business = data["businessName"] as? String ?? ""
                    
                    let user = User(id: id, name: name, email: email, businessName: business)
                    self.users.append(user)
                }
            }
        }
    }
}
////
////    func addUser(business: String) {
////        let db = Firestore.firestore()
////        let ref = db.collection("Users").document(business)
////        ref.setData(["Business": business, "ID": 10]) {error in
////            if let error = error {
////                print(error.localizedDescription)
////            }
////        }
////    }
////}
