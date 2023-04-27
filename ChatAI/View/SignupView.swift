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
    @EnvironmentObject var dataManager: DataManager
    @State private var name = ""
    @State private var businessName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var profileImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var userIsLoggedIn = false
    @State private var isAgree = false
    @State var showNextPage = false

    var body: some View {
        ZStack {
            // insert background
            Color.white
            Image("signup_background")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ScrollView {
                VStack{
                    Image("signup")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: 45)
                        .frame(width:400, height: 200)
                        
                    // name field
                    Group {
                        RoundedTextField(title: "Name", text: $name)
                        RoundedTextField(title: "Business Name", text: $businessName)
                        RoundedTextField(title: "Email", text: $email)
                        RoundedTextField(title: "Password", text: $password, type: 1)
                        RoundedTextField(title: "Re-Type Password", text: $passwordConfirm, type: 1)
                        
                        VStack {
                         Button(action: {
                             isShowingImagePicker = true
                             
                         }) {
                             HStack {
                                 Text("Add Profile Picture")
                                 Image(systemName:"camera")
                             }
                             .padding()
                             .background(Color("dairyBlue"))
                             .foregroundColor(.black)
                             .cornerRadius(10)
                             .frame(width: 500)
                         }
                         .sheet(isPresented: $isShowingImagePicker) {
                             ImagePickerView(selectedImage: $profileImage)
                         }
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
                                    .bold()
                                    .foregroundColor(Color("dairyBlue"))
                                Text("Here")
                                    .foregroundColor(.black)
                            }
                        } //Vstack
                        
                        NavigationLink("DONE", destination: WalkthroughView().onAppear {

                            self.register()
                        })
                            .disabled(!self.isAgree)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .frame(width: 150)
                            .bold()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("dairyBlue"))
                            )
                        Button(action: {
                                presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("BACK")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("dairyBlue"))
                        )

                    }

                }
                .frame(width: 350)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
        func register() {
            if (password != passwordConfirm) {
                // Create a new alert
          print("passwords no match")
                

            }
            else {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
                //add to user db
                dataManager.postUsers(Name: name, Email: email, BusinessName: businessName)
            }
        } // register
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
