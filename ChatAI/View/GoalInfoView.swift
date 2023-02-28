//
//  GoalInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI

struct GoalInfoView: View {
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
                        Text("Brief Expectation?")
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
                        Text("Scope of work?")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                // password
                TextField("Password", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Creative Direction")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .foregroundColor(.black)
                        
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                
                // register button
                HStack {
                    NavigationLink(destination: BrandInfoView()) {
                        Text("Back")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color("dairyBlue"))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                .offset(y: 10)
                    
                    // register button
                    NavigationLink(destination: CustomerInfoView()) {
                        Text("Next")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color("dairyBlue"))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 10)
                }
                
                HStack{
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                        .padding(10)
                    Image("cowIcon")
                        .resizable()
                        .frame(width: 50, height:40)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                        .padding(10)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                        .padding(10)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                        .padding(10)
                }
            }
            .frame(width: 350)
        }
    }
}

struct GoalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GoalInfoView()
    }
}
