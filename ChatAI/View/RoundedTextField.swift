//
//  RoundedTextField.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
struct RoundedTextField: View {
    var title: String
    @Binding var text: String
    var type: Int = 0
    
    var body: some View {
        if type == 0 {
            TextField(title, text: $text)
                .foregroundColor(.black)
                .frame(height: 20)
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
                .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                .cornerRadius(30)
                .padding()
        } else {
            SecureField(title, text: $text)
                .foregroundColor(.black)
                .frame(height: 20)
                .padding(25)
                .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                .cornerRadius(30)
                .padding()
        }
    }
}
struct RoundedTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedTextField(title: "hello", text: .constant(""), type: 0)
            RoundedTextField(title: "hello", text: .constant("222"), type: 1)
        }
    }
}

