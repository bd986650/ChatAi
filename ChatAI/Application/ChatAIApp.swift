

import SwiftUI
import Firebase

@main
struct ChatAIApp: App {
    init() {
        FirebaseApp.configure()
//        let Database = Firebase.
//        let databaseRef = Database.database().reference()
    }
    var body: some Scene {
        WindowGroup {
//            HomeView(viewModel: ViewModel())
            SplashView()
//                .environmentObject(databaseRef)
        }
    }
}
