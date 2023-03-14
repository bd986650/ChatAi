//
//  SignupView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI

struct SignupView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            
            VStack (spacing: 20){
                // logo
                Text("dAIry market")
                    .foregroundColor(Color("dairyBlue"))
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -5, y: -100)
               
                // name field
                TextField("Name", text: $name)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Name")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                // email
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                // password
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .foregroundColor(.black)
                        
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                // password confirmation
                SecureField("Password Confirmation", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password Confirmation")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                // register button
                NavigationLink(destination: BrandInfoView().navigationBarBackButtonHidden(true)) {
                    Text("Register")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color("dairyBlue"))
                            )
                            .foregroundColor(.white)
                    
                    .padding(.top)
                .offset(y: 10)
                }
            }
            .frame(width: 350)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
