//
//  SplashView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
import Firebase

enum Legal: Identifiable {
    case signin
    case brand
    case signup
    case profile
    var id: Legal { self }
}

struct SplashView: View {
   
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                Image("home")
                    .resizable()
                
                VStack {
                    Image("dairyLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("The AI-generated marketing")
                        Text("agency in your pocket")
                    }.offset(y: -30)
                    
                    NavigationLink("SIGN UP", value: Legal.signup)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue)
                        )
                    NavigationLink("SIGN IN", value: Legal.signin)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue)
                            )
                }.offset(y: -150)
            }
            .navigationDestination(for: Legal.self) { selection in
                switch selection {
                case .signin:
                    LoginView()
                case .signup:
                    SignupView()
                case .brand:
                    WalkthroughView()
                case .profile:
                    ProfileandHomePageView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
       // .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
