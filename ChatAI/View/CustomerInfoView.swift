//
//  CustomerInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CustomerInfoView: View {
    @State private var age = ""
    @State private var gender = ""
    @State private var they = ""
    
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
                    RoundedTextField(title: "Type here...", text: $age).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Gender ")
                        Text("identity?").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $gender).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("In one sentence, ")
                        Text("who are they? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $they).offset(y: -15)
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
