

import SwiftUI
import Firebase

@main
struct ChatAIApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            HomeView(viewModel: ViewModel())
            SplashView()
        }
    }
}
