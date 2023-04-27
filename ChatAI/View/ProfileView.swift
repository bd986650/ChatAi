//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    @EnvironmentObject var dataManager: DataManager
    
    let types: [Int] = [0, 1, 2]
    var name = "Sarah Apple"
    var brandName = "Upcycle Athens"
    @State private var showSheet = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
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
                        .frame(width: 50)
                    Text(dataManager.users[0].name)
                    
                    Text(dataManager.users[0].businessName)
                }
                //.offset(x: -50)
            .fixedSize()
            }
            Spacer()
                .frame(height: 10)
            Text("ADD PROJECT")
                .foregroundColor(.blue)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue)
                )
            
            HStack {
                VStack(alignment: .center) {
                    Text("INSTA CAPTIONS")
                        .frame(height: 30)
                    Text("FB POSTS")
                        .frame(height: 30)
                    Text("TWEETS")
                        .frame(height: 30)
//                    Text("CREATIVE DIRECTION")
//                        .frame(height: 30)
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
    //                    Text(dataManager.users[0].name)
                        Text(name)
                        Text(brandName)
                    }
                    //.offset(x: -50)
                .fixedSize()
                

                VStack {
    
                    HStack {
                        Text("view")
                            .font(.system(size: 15))
                            .padding(.vertical, 7)
                            .frame(width: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.blue)
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
                        Text("view")
                            .font(.system(size: 15))
                            .padding(.vertical, 7)
                            .frame(width: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.blue)
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
                        Text("view")
                            .font(.system(size: 15))
                            .padding(.vertical, 7)
                            .frame(width: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.blue)
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
                }
//                VStack {
//                    ForEach((0...3), id: \.self) { i in
//                        HStack {
//                            Text("view")
//                                .font(.system(size: 14))
//                                .padding(.vertical, 5)
//                                .frame(width: 60)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .stroke(.blue)
//                                )
//                            Text("modify")
//                                .font(.system(size: 14))
//                                .padding(.vertical, 5)
//                                .frame(width: 60)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .stroke(.blue)
//                                )
//                        }
//                        .frame(height: 30)
//                    }
//                }

            }
            .frame(width: 350)
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
                                        .foregroundColor(Color("DairyBlue"))
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
                                        .foregroundColor(Color("DairyBlue"))
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
                                        .foregroundColor(Color("DairyBlue"))
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
struct ProfileView_Previews: PreviewProvider {
    static let dataManager = DataManager()
    static var previews: some View {
        ProfileView(currentView: .constant(0))
            .environmentObject(dataManager)
    }
}


