//
//  CustomerNeedsView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CustomerNeedsView: View {
    @State private var point = ""
    @State private var reservation = ""
    @State private var interaction = ""
    
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("needs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are their current ")
                        Text("pain points?   ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $point).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Do they have any ")
                        Text("reservations?").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $reservation).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter goals related to ")
                        Text("customer interaction ").foregroundColor(.blue.opacity(0.4))
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $interaction).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct CustomerNeedsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerNeedsView()
    }
}
