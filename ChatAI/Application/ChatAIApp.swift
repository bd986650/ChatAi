

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

@main
struct ChatAIApp: App {
    @StateObject var dataManager = DataManager()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(dataManager)
        }
    }
}
