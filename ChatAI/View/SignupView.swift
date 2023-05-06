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
    struct SignUpError: Identifiable {
        let id = UUID()
        let message: String
    }
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    @State private var clickedDone = false
    @State private var name = ""
    @State private var businessName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
//    @State private var profileImage: UIImage? = nil
//    @State private var isShowingImagePicker = false
    @State private var userIsLoggedIn = false
    @State private var isAgree = false
    @State var showNextPage = false
    @State private var alertMessage: SignUpError?

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
                        
                        Button(action: {
                            if self.isAgree {
                                self.register()
                               
                                
                            }
                        }) {
                            Text("DONE")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 40)
                                .frame(width: 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.blue)
                                )
                        }
                        .disabled(!self.isAgree || clickedDone)
                        .opacity(clickedDone ? 0.0 : 1.0)
                        
                        .overlay (
                     
                        NavigationLink("NEXT", destination: WalkthroughView().onAppear {
                            print("here")
                           
                        })
                            .disabled(!self.clickedDone)

                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .frame(width: 150)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("dairyBlue"))
                            )

                            .opacity(clickedDone ? 1.0 : 0.0)
                        
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
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .frame(width: 350)
                .alert(item: $alertMessage) { message in
                    Alert(title: Text("Error"), message: Text(message.message), dismissButton: .default(Text("OK")))
                  }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func register() {
        if (password != passwordConfirm) {
            // Show alert if passwords don't match
            alertMessage = SignUpError(message: "Passwords do not match")
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    // Show alert if an error occurs during registration
                    alertMessage = SignUpError(message: error.localizedDescription)
                } else if let result = result {
                    // Registration successful, add user data to database
                    self.clickedDone = true
                    let userId = result.user.uid
                    dataManager.postUsers(Name: name, Email: email, BusinessName: businessName, Password: password, UserId: userId)
                }
            }
        }
    }//register
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
