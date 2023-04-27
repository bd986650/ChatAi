//
//  SignupView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
import Firebase

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
 
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
 
            configuration.label
 
        }
    }
}

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var businessName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var userIsLoggedIn = false
    @State private var isAgree = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            Image("signup_background")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack (spacing: 20){
                Image("signup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                // name field
                Group {
                    RoundedTextField(title: "Name", text: $name)
                    RoundedTextField(title: "Business Name", text: $businessName)
                    RoundedTextField(title: "Email", text: $email)
                    RoundedTextField(title: "Password", text: $password, type: 1)
                    RoundedTextField(title: "Re-Type Password", text: $passwordConfirm, type: 1)
                    
                    VStack {
                        Toggle(isOn: $isAgree) {
                            Text("I accept the Privacy Policy and Terms")
                                .foregroundColor(.black)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.black)
                            NavigationLink("Sign in", value: Legal.signin)
                            Text("Here")
                                .foregroundColor(.black)
                        }
                    } //Vstack
                    
                    NavigationLink("DONE", destination: WalkthroughView().onAppear {
                        print("here")
                        self.register()
                    })
                        .disabled(!self.isAgree)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.blue)
                        )
//                    Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Text("BACK")
//
//                    }
//                    .padding(.vertical, 10)
//                    .padding(.horizontal, 40)
//                    .frame(width: 150)
//                    .background(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(.blue)
//                    )
                }
            }
            .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
        func register() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
            }
        } // register
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
