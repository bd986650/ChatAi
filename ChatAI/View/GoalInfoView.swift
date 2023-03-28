//
//  GoalInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct GoalInfoView: View {
    
    @EnvironmentObject var userInfo : UserInfo
    @State private var userIsLoggedIn = false
    
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("goal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your ")
                        Text("scope of work ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.work).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your ")
                        Text("marketing goals?").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.goals).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your ")
                        Text("expectations? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.expectation).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalInfoView()
    }
}
