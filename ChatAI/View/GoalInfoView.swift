//
//  GoalInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct GoalInfoView: View {
    
    @State private var work = ""
    @State private var goals = ""
    @State private var expectation = ""
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
                    RoundedTextField(title: "Type here...", text: $work).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your ")
                        Text("marketing goals?").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $goals).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your ")
                        Text("expectations? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $expectation).offset(y: -15)
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
