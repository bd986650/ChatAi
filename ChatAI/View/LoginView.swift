import SwiftUI
//import Firebase
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
                
                
                RoundedTextField(title: "Email", text: $email)
                RoundedTextField(title: "Password", text: $password)
                
                HStack {
                    Text("Don’t have an account?")
                    NavigationLink("Sign up", value: Legal.signup)
                    Text("Here")
                }
                
                NavigationLink("SIGN IN", value: Legal.brand)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .frame(width: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.blue)
                    )
                
           /*Add back button here*/
                
                Button(action: {
                                      presentationMode.wrappedValue.dismiss()
                }) {
                    Text("BACK")
//                        .foregroundColor(Color("UserMessageColor"))
                        
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .frame(width: 150)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue)
                )
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
    
    
    func login() {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
    }
    func register(){
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
    }
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
