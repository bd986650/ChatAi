//
//  SplashView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView() {
            ZStack {
                Color.white
                VStack {
                    Image("DairyMarketIcon")
                        .resizable()
                        .frame(width: 300, height: 250)
                        
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)){
                            Text("Login")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: 250)
                        .padding()
                        .background(Color("dairyBlue"))
                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true)) {
                        Text("Register")
                                .font(.title)
                                .foregroundColor(Color("dairyBlue"))
                                .frame(maxWidth: 250)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("dairyBlue"), lineWidth: 2)
                        )
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        //.foregroundColor(.white)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
