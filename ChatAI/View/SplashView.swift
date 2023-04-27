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
    @EnvironmentObject var dataManager: DataManager
   
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                Image("home")
                    .resizable()
                
                VStack {
                    Image("dairyLogo")
                        .resizable()
                        .frame(width: 130, height: 180)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("Milk Your Content")
                        Text("AI Marketing Agency")
                    }.offset(y: -3)
                    
                    NavigationLink("SIGN UP", value: Legal.signup)
                        .foregroundColor(Color("dairyBlue"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("dairyBlue"))
                        )
                    NavigationLink("SIGN IN", value: Legal.signin)
                        .foregroundColor(Color("dairyBlue"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("dairyBlue"))
                            )
                }.offset(y: -150)
            }
            .navigationDestination(for: Legal.self) { selection in
                switch selection {
                case .signin:
                    LoginView().navigationBarBackButtonHidden(true)
                case .signup:
                    SignupView().navigationBarBackButtonHidden(true)
                case .brand:
                    WalkthroughView()
                case .profile:
                    ProfileandHomePageView()
                        .environmentObject(dataManager)
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
