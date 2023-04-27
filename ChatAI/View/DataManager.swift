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
    @Published var users: [User] = []
    @Published var userCurrent: User = User(id: "String", name: "String", email: "String", businessName: "String")
    @Published var instagrams: [Instagram] = []
    @Published var facebooks: [Instagram] = []
    @Published var twitters: [Instagram] = []
    @Published var marketingBriefs: [MarketingBrief] = []
    
    init () {
        fetchUsers()
        fetchInstagrams()
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
                    
                    let id = data["uId"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let business = data["businessName"] as? String ?? ""
                    
                    let user = User(id: id, name: name, email: email, businessName: business)
                    self.users.append(user)
                }
            }
        }
    }
    
    func fetchCurrentUser() {
//        users.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        
        if let userId = Auth.auth().currentUser?.uid {
            print("fetching current user...")
            print(userId)
            ref.whereField("uId", isEqualTo: userId).getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        
                        let id = data["uId"] as? String ?? ""
                        let name = data["name"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let business = data["businessName"] as? String ?? ""
                        print(name)
                        let user = User(id: id, name: name, email: email, businessName: business)
                        self.users.append(user)
                    }
                }
            }
        }
    }
    
    func postUsers(Name: String, Email: String, BusinessName: String) {
        let db = Firestore.firestore()
        let usersRef = db.collection("Users")
    
        if let userId = Auth.auth().currentUser?.uid {
            // create a dictionary with the data you want to add to the document
            let data: [String: Any] = [
                "uId": userId,
                "name": Name,
                "email": Email,
                "businessName": BusinessName
            ]
            
            // add the document to the collection
            usersRef.addDocument(data: data) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document added successfully")
                    
                }
            }
        }
        
        
    }
    
    //INSTA
    func fetchInstagrams() {
        instagrams.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Instagrams")
        
        if let userId = Auth.auth().currentUser?.uid {
            // Do something with the user ID
            
            
            ref.whereField("uId", isEqualTo: userId).getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        
                        let id = document.documentID
                        let caption = data["caption"] as? String ?? ""
                        let uId = data["uId"] as? String ?? ""
                        
                        let instagram = Instagram(id: id, caption: caption, uId: uId)
                        self.instagrams.append(instagram)
                        
                        
                    }
                }
            }
            print("Current user ID is: \(userId)")
        } else {
            // No user is currently signed in
            print("No user is currently signed in")
        }
        
    }
    
    func postInstagrams(Caption: String) {
        let db = Firestore.firestore()
        let instagramsRef = db.collection("Instagrams")
        if (Caption != "") {
            if let userId = Auth.auth().currentUser?.uid {
                // create a dictionary with the data you want to add to the document
                let data: [String: Any] = [
                    "caption": Caption,
                    "uId": userId
                ]
                
                // add the document to the collection
                instagramsRef.addDocument(data: data) { error in
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added successfully")
                        
                    }
                }
                
                
            }
            else {
                print("user not found")
            }
        }
        
    }
    
    //facebook db
    func fetchFacebooks() {
        facebooks.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Facebooks")
        
        if let userId = Auth.auth().currentUser?.uid {
            // Do something with the user ID
            
            
            ref.whereField("uId", isEqualTo: userId).getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        
                        let id = document.documentID
                        let caption = data["caption"] as? String ?? ""
                        let uId = data["uId"] as? String ?? ""
                        
                        let facebook = Instagram(id: id, caption: caption, uId: uId)
                        self.facebooks.append(facebook)
                        
                        
                    }
                }
            }
            print("Current user ID is: \(userId)")
        } else {
            // No user is currently signed in
            print("No user is currently signed in")
        }
        
    }
    
    func postFacebooks(Caption: String) {
        let db = Firestore.firestore()
        let facebooksRef = db.collection("Facebooks")
        if (Caption != "") {
            if let userId = Auth.auth().currentUser?.uid {
                // create a dictionary with the data you want to add to the document
                let data: [String: Any] = [
                    "caption": Caption,
                    "uId": userId
                ]
                
                // add the document to the collection
                facebooksRef.addDocument(data: data) { error in
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added successfully")
                        
                    }
                }
                
                
            }
            else {
                print("user not found")
            }
        }
        
    }
    
    //Twitter db
    func fetchTwitters() {
        twitters.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Twitters")
        
        if let userId = Auth.auth().currentUser?.uid {
            // Do something with the user ID
            
            
            ref.whereField("uId", isEqualTo: userId).getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        
                        let id = document.documentID
                        let caption = data["caption"] as? String ?? ""
                        let uId = data["uId"] as? String ?? ""
                        
                        let twitter = Instagram(id: id, caption: caption, uId: uId)
                        self.twitters.append(twitter)
                        
                        
                    }
                }
            }
            print("Current user ID is: \(userId)")
        } else {
            // No user is currently signed in
            print("No user is currently signed in")
        }
        
    }
    
    
    func postTwitters(Caption: String) {
        let db = Firestore.firestore()
        let twittersRef = db.collection("Twitters")
        if (Caption != "") {
            if let userId = Auth.auth().currentUser?.uid {
                // create a dictionary with the data you want to add to the document
                let data: [String: Any] = [
                    "caption": Caption,
                    "uId": userId
                ]
                
                // add the document to the collection
                twittersRef.addDocument(data: data) { error in
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added successfully")
                        
                    }
                }
                
                
            }
            else {
                print("user not found")
            }
        }
        
    }
    //Marketing Brief DB
    
    func postMarketingBrief(Brief: String) {
        
        let db = Firestore.firestore()
        let twittersRef = db.collection("MarketingBriefs")
        if (Brief != "") {
            if let userId = Auth.auth().currentUser?.uid {
                // create a dictionary with the data you want to add to the document
                let data: [String: Any] = [
                    "brief": Brief,
                    "uId": userId
                ]
                
                // add the document to the collection
                twittersRef.addDocument(data: data) { error in
                    if let error = error {
                        print("Error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added successfully")
                        
                    }
                }
                
                
            }
            else {
                print("user not found")
            }
        }
        
    }
    
    func fetchMarketingBriefs() {
        
        marketingBriefs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("MarketingBriefs")
        
        if let userId = Auth.auth().currentUser?.uid {
            // Do something with the user ID
            
            
            ref.whereField("uId", isEqualTo: userId).getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        
                        let id = document.documentID
                        let brief = data["brief"] as? String ?? ""
                        let uId = data["uId"] as? String ?? ""
                        
                        let briefAdd = MarketingBrief(id: id, brief: brief, uId: uId)
                        self.marketingBriefs.append(briefAdd)
                        
                        
                    }
                }
            }
            print("Current user ID is: \(userId)")
        } else {
            // No user is currently signed in
            print("No user is currently signed in")
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
