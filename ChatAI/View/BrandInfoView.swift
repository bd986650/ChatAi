//
//  BrandInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct BrandInfoView: View {
    
    @State private var mission = ""
    @State private var values = ""
    @State private var advantage = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                // logo
                Image("brand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your brand’s")
                        Text("mission? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $mission).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your brand’s")
                        Text("values? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $values).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your")
                        Text("competitive advantage? ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $advantage).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
    
    static func send() {
        
    }
}
struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandInfoView()
    }
}
