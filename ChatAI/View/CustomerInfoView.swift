//
//  CustomerInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CustomerInfoView: View {
 
    @EnvironmentObject var userInfo : UserInfo
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("target")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your ")
                        Text("target customer’s age?   ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.age).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Gender ")
                        Text("identity?").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.gender).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("In one sentence, ")
                        Text("who are they? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.they).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct CustomerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerInfoView()
    }
}
