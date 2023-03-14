import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn {
            content
            //ListView()
//            ListView()
//               .environmentObject(DataManager())
        } else {
            content
        }
    }
    var content: some View {
        ZStack {
            Color.white
            
            VStack (spacing: 20) {
                Text("dAIry market")
                    .foregroundColor(Color("dairyBlue"))
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -5, y: -100)
                          
                // email
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(Color("dairyBlue"))
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(Color("dairyBlue"))
                
                // password
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(Color("dairyBlue"))
                            .bold()
                    }
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(Color("dairyBlue"))
                
                // sign in 
                NavigationLink(destination: BrandInfoView().navigationBarBackButtonHidden(true)) {
                    Text("sign in")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color("dairyBlue"))
                            )
                            .foregroundColor(.white)
                    
                    .padding(.top)
                .offset(y: 10)
                }
                NavigationLink {
                    //userRegistration()
                    //register()
                    //login()
                } label: {
                    Text("New User? Create Account")
                        .bold()
                        .foregroundColor(Color("dairyBlue"))
                }
                .padding(.top)
                //.offset(y: 10)
            }
            .frame(width: 350)
           // .onAppear {
                //Auth.auth().addStateDidChangeListener { auth, user in
                    //if user != nil {
                    //    userIsLoggedIn.toggle()
                   // }
               // }
           // }
        }
        .ignoresSafeArea()
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
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
