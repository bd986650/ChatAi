//
//  CreativeDirectionView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CreativeDirectionView: View {
    @State private var tone = ""
    @State private var message = ""
    @State private var style = ""
    
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("direction")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s ")
                        Text("tone    ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $tone).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s ")
                        Text("message").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $message).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s ")
                        Text("style ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $style).offset(y: -15)
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
