//
//  BrandInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI

struct BrandInfoView: View {
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
                        Text("What is your brand's mission?")
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
                        Text("What are your brand's values?")
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
                        Text("What is your competitive advantage?")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .foregroundColor(.black)
                        
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                
                // register button
                NavigationLink(destination: GoalInfoView().navigationBarBackButtonHidden(true)) {
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
                
                HStack{
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

struct BrandInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BrandInfoView()
    }
}
