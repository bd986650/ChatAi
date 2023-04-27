//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    
    let types: [Int] = [0, 1, 2]
    var name = "Sarah Apple"
    var brandName = "Upcycle Athens"
    @State private var showSheet = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
    @State private var showSheet4 = false
    @Binding var currentView: Int
    
    var body: some View {
        
        ZStack {
            Color.white
            Image("signup_background")
                .resizable()
                .offset(y: 400)
            Image("signup_background")
                .resizable()
                .offset(y: -400)
            
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                    .frame(height: 5)
                ZStack {
                    Image(systemName: "square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("dairyGold"), Color("dairyBlue")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(Image(systemName: "square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                            )
                        )
                    
                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text(name)
                        Text(brandName)
                        //                        Text(dataManager.users[0].name)
                        //                        Text(dataManager.users[0].businessName)
                    }
                    //.offset(x: -50)
                    .fixedSize()
                }
//
//                Spacer()
//                    .frame(height: 10)
//                HStack {
//                    VStack(alignment: .center) {
                        VStack(alignment: .center) {
                            
                            HStack {
                                Text("INSTA CAPTIONS")
                                    .frame(height: 30)
                                Spacer()
                                    .frame(width: 20)
                                Text("view")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 7)
                                    .frame(width: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("dairyBlue"))
                                    )
                                    .onTapGesture {
                                        dataManager.fetchInstagrams()
                                        withAnimation {
                                            self.showSheet.toggle()
                                            
                                            
                                        }
                                    }
                                    .sheet(isPresented: $showSheet) {
                                        PopupView(type: 0, showSheet: $showSheet)
                                            .environmentObject(dataManager)
                                    }
                            }
                            .frame(height: 30)
                            HStack {
                                Text("FB POSTS")
                                    .frame(height: 30)
                                Spacer()
                                    .frame(width: 75)
                                Text("view")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 7)
                                    .frame(width: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("dairyBlue"))
                                    )
                                    .onTapGesture {
                                        dataManager.fetchFacebooks()
                                        withAnimation {
                                            self.showSheet2.toggle()
                                            
                                            
                                        }
                                    }
                                    .sheet(isPresented: $showSheet2) {
                                        PopupViewFacebook(type: 1, showSheet2: $showSheet2)
                                            .environmentObject(dataManager)
                                    }
                                
                            }
                            
                            .frame(height: 30)
                            
                            HStack {
                                Text("TWEETS")
                                    .frame(height: 30)
                                Spacer()
                                    .frame(width: 90)
                                Text("view")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 7)
                                    .frame(width: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("dairyBlue"))
                                    )
                                    .onTapGesture {
                                        dataManager.fetchTwitters()
                                        withAnimation {
                                            self.showSheet3.toggle()
                                            
                                            
                                        }
                                    }
                                    .sheet(isPresented: $showSheet3) {
                                        PopupViewTwitter(type: 2, showSheet3: $showSheet3)
                                            .environmentObject(dataManager)
                                    }
                                
                            }
                            
                            .frame(height: 30)
                            HStack {
                                Text("MARKETING BRIEF")
                                    .frame(height: 30)
                                Spacer()
                                    .frame(width: 10)
                                Text("view")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 7)
                                    .frame(width: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("dairyBlue"))
                                    )
                                    .onTapGesture {
                                        dataManager.fetchMarketingBriefs()
                                        withAnimation {
                                            self.showSheet4.toggle()
                                            
                                            
                                        }
                                    }
                                    .sheet(isPresented: $showSheet4) {
                                        PopupViewMarketingBrief(type: 2, showSheet4: $showSheet4)
                                            .environmentObject(dataManager)
                                    }
                                
                            }
                            .frame(height: 30)
                            HStack {
//                                Text("LOGOUT")
//                                    .frame(height: 30)
//                                Spacer()
//                                    .frame(width: 85)
                                Text("LOGOUT")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 7)
                                    .frame(width: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("dairyGold"))
                                    )
                                    .onTapGesture {
//                                        logout()
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    .sheet(isPresented: $showSheet3) {
                                        PopupViewTwitter(type: 2, showSheet3: $showSheet3)
                                            .environmentObject(dataManager)
                                    }
                                
                            }
                }
                .frame(width: 350)
                Spacer()
            }
        }
        
    }
}
    struct PopupView: View {
        @EnvironmentObject var dataManager: DataManager
        var type: Int
        //these arrays below will be populated from the database but this will do for now
        @Binding var showSheet: Bool
        
        var body: some View {
            
            VStack {
                Text("MY MARKETING STRATEGY")
                    .padding(.top,   40)
                
                
                Text("Insta Captions")
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(dataManager.instagrams) { item in
                            GeometryReader { geometry in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("dairyBlue"))
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                    Text(item.caption)
                                        .padding(20)
                                }
                            }
                            .frame(height: getHeight(for: item.caption))
                        }
                    }
                }
                .frame(width: 350, height: 560)
                
                
                
                
                Button("Dismiss") {
                    print(type)
                    self.showSheet.toggle()
                }
                .foregroundColor(Color("cheddarChzOrange"))
                
                Spacer()
            }
            .frame(height: 960)
            .frame(width: UIScreen.main.bounds.width)
            .background(.white)
            //        .clipShape(RoundedRectangle(cornerRadius: 80))
            .offset(y: (showSheet ? 100 : 500))
        }
        
        
    }
    struct PopupViewFacebook: View {
        @EnvironmentObject var dataManager: DataManager
        var type: Int
        //these arrays below will be populated from the database but this will do for now
        @Binding var showSheet2: Bool
        
        var body: some View {
            
            VStack {
                Text("MY MARKETING STRATEGY")
                    .padding(.top,   40)
                
                
                Text("Facebook Posts")
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(dataManager.facebooks) { item in
                            GeometryReader { geometry in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("dairyBlue"))
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                    Text(item.caption)
                                        .padding(20)
                                }
                            }
                            .frame(height: getHeight(for: item.caption))
                        }
                    }
                }
                .frame(width: 350, height: 560)
                
                
                Button("Dismiss") {
                    print(type)
                    self.showSheet2.toggle()
                }
                .foregroundColor(Color("cheddarChzOrange"))
                
                Spacer()
            }
            .frame(height: 960)
            .frame(width: UIScreen.main.bounds.width)
            .background(.white)
            //        .clipShape(RoundedRectangle(cornerRadius: 80))
            .offset(y: (showSheet2 ? 100 : 500))
        }
        
        
    }
    struct PopupViewTwitter: View {
        @EnvironmentObject var dataManager: DataManager
        var type: Int
        //these arrays below will be populated from the database but this will do for now
        @Binding var showSheet3: Bool
        
        var body: some View {
            
            VStack {
                Text("MY MARKETING STRATEGY")
                    .padding(.top,   40)
                
                
                
                
                Text("Tweets")
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(dataManager.twitters) { item in
                            GeometryReader { geometry in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("dairyBlue"))
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                    Text(item.caption)
                                        .padding(20)
                                }
                            }
                            .frame(height: getHeight(for: item.caption))
                        }
                    }
                }
                .frame(width: 350, height: 560)
                
                
                Button("Dismiss") {
                    print(type)
                    self.showSheet3.toggle()
                }
                .foregroundColor(Color("cheddarChzOrange"))
                
                Spacer()
            }
            .frame(height: 960)
            .frame(width: UIScreen.main.bounds.width)
            .background(.white)
            //        .clipShape(RoundedRectangle(cornerRadius: 80))
            .offset(y: (showSheet3 ? 100 : 500))
        }
        
    }

struct PopupViewMarketingBrief: View {
    @EnvironmentObject var dataManager: DataManager
    var type: Int
    //these arrays below will be populated from the database but this will do for now
    @Binding var showSheet4: Bool
    
    var body: some View {
        
        VStack {
            Text("MY MARKETING STRATEGY")
                .padding(.top,   40)
            
            
            
            
            Text("Tweets")
                .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(dataManager.marketingBriefs) { item in
                        GeometryReader { geometry in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("dairyBlue"))
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                Text(item.brief)
                                    .padding(20)
                            }
                        }
                        .frame(height: getHeight(for: item.brief))
                    }
                }
            }
            .frame(width: 350, height: 560)
            
            
            Button("Dismiss") {
                print(type)
                self.showSheet4.toggle()
            }
            .foregroundColor(Color("cheddarChzOrange"))
            
            Spacer()
        }
        .frame(height: 960)
        .frame(width: UIScreen.main.bounds.width)
        .background(.white)
        //        .clipShape(RoundedRectangle(cornerRadius: 80))
        .offset(y: (showSheet4 ? 100 : 500))
    }
    
}

    func getHeight(for text: String) -> CGFloat {
        let textHeight = text.height(withConstrainedWidth: UIScreen.main.bounds.width - 20, font: .systemFont(ofSize: 17, weight: .regular))
        //        print(text)
        
        return textHeight + 90 // add some padding for the text
    }
    
    extension String {
        func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
            return ceil(boundingBox.height)
        }
    }

func logout() {
    do {
        try Auth.auth().signOut()
        // Additional actions after successful logout
    } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
    }
}

    struct ProfileView_Previews: PreviewProvider {
        static let dataManager = DataManager()
        static var previews: some View {
            ProfileView(currentView: .constant(0))
                .environmentObject(dataManager)
        }
    }



