//
//  CreativeDirectionView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI

struct CreativeDirectionView: View {
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
                        Text("What is the tone of your creative direction?")
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
                        Text("What message are you trying to promote?")
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
                        Text("What is the style of your creative direction?")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .foregroundColor(.black)
                        
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.black)
                
                
                // register button
                HStack {
                    NavigationLink(destination: CustomerNeedsView().navigationBarBackButtonHidden(true)) {
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
                    NavigationLink(destination: CreativeDirectionView().navigationBarBackButtonHidden(true)) {
                        Button {
                            generateMarketingBrief(product: "Food delivery phone app", targetDemographic: "18-30", demographicInfo: "Household income 20k-$50k", gender: "female", targetSentence: "This product is perfect for someone hosting a party.")
                            
                            let title = "College Decisions"
                            let location = "University of Georgia"
                            let hashtags = ["marketing", "photography"]
                            let prompt = "Grady College at UGA is the best college"
                            generateInstagramCaption(title: title, location: location, hashtags: hashtags, prompt: prompt)
                            //print("AI Generated instgram caption: " + caption)
                        } label: {
                            Text("Submit")
                                .bold()
                                .frame(width: 200, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .foregroundColor(Color("dairyBlue"))
                                )
                                .foregroundColor(.white)
                        }

                        
                    }
                    .padding(.top)
                    .offset(y: 10)
                }
                
                HStack{
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
                    Image("cowIcon")
                        .resizable()
                        .frame(width: 50, height:40)
                        
                }
            }
            .frame(width: 350)
        }
    }
}

struct CreativeDirectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreativeDirectionView()
    }
}
