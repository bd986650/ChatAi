import SwiftUI
import Firebase

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        ZStack {
            Color.white
            Image("signin_background")
                .resizable()
            
            VStack (spacing: 20) {
                
                Image("signin")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 45)
                    .frame(width:400, height: 200)
                RoundedTextField(title: "Email", text: $email)
                RoundedTextField(title: "Password", text: $password, type: 1)
                
                HStack {
                    Text("Don’t have an account?")
                    NavigationLink("Sign up", value: Legal.signup)
                        .foregroundColor(Color("dairyBlue"))
                        .bold()
                }
                
                NavigationLink("SIGN IN", destination: ProfileandHomePageView()
                    .navigationBarBackButtonHidden(true)
                    .onAppear {
                    self.login()
                })
                .foregroundColor(Color("dairyBlue"))
                .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .frame(width: 150)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("dairyBlue"))
                    )
                
           /*Add back button here*/
                
                Button(action: {
                                      presentationMode.wrappedValue.dismiss()
                }) {
                    Text("BACK")
                        .foregroundColor(Color("dairyBlue"))
                        
                        
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .frame(width: 150)
                .bold()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("dairyBlue"))
                        
                )
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
    
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    } // login
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
