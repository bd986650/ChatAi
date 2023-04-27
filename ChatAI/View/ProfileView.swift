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
    
    
    var name = "Sarah Apple"
    var brandName = "Upcycle Athens"
    @State private var showSheet = false
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
    //                    Text(dataManager.users[0].name)
                        Text(name)
                        Text(brandName)
                    }
                    //.offset(x: -50)
                .fixedSize()
                }
                Spacer()
                    .frame(height: 10)
    //            Text("ADD PROJECT")
    //                .foregroundColor(.blue)
    //                .padding(.vertical, 10)
    //                .padding(.horizontal, 40)
    //                .frame(width: 200)
    //                .background(
    //                    RoundedRectangle(cornerRadius: 12)
    //                        .stroke(.blue)
    //                )
                
                HStack {
                    VStack(alignment: .center, spacing: 20) {
                        Text("INSTA CAPTIONS")
                            .frame(height: 30)
                            .bold()
                        Text("FB POSTS")
                            .frame(height: 30)
                            .bold()
                        Text("TWEETS")
                            .frame(height: 30)
                            .bold()
                        Text("MARKETING BRIEF")
                            .frame(height: 30)
                            .bold()
                    }
                    
                    VStack(spacing: 20) {
                    ForEach((0...3), id: \.self) { i in
                        HStack{
                            Text("view")
                                .font(.system(size: 15))
                                .padding(.vertical, 7)
                                .frame(width: 100)
                                .bold()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("dairyBlue"))
                                )
                                .onTapGesture {
                                    withAnimation {
                                        self.showSheet.toggle()
                                        
                                    }
                                }
                                .sheet(isPresented: $showSheet) {
                                    PopupView(showSheet: $showSheet)
                                }
                            //                    Text("modify")
                            //                        .font(.system(size: 14))
                            //                        .padding(.vertical, 5)
                            //                        .frame(width: 60)
                            //                        .background(
                            //                            RoundedRectangle(cornerRadius: 20)
                            //                                .stroke(.blue)
                            //                        )
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
                
                Spacer()
    //            Text("View my marketing strategy")
    //                .foregroundColor(.blue)
    //                .onTapGesture {
    //                    withAnimation {
    //                        self.showSheet.toggle()
    //
    //                    }
    //                }
    //                .sheet(isPresented: $showSheet) {
    //                    PopupView(showSheet: $showSheet)
    //                }
                Spacer()
                    .frame(height: 100)
    //            PopupView(showSheet: $showSheet)
            }
            .frame(width: 350)
        }
    }
}
struct PopupView: View {
    //these arrays below will be populated from the database but this will do for now
    var instagram = ["Hey Sustainable Trendsetters! We are excited to launch our eco-friendly clothing line that incorporates the latest fashion trends while keeping the planet in mind.", " Quality stitching is our top priority, and we are confident you'll love the unique pieces we offer at affordable prices.", "Our mission is to make a positive impact on the environment and encourage sustainable fashion choices.", "We are excited to introduce ourselves to the UGA community and would love your support in spreading the word about our brand.", "For those who are hesitant about the quality of our clothes, we can guarantee that they are made to last and endure the test of time.", "We want to encourage upcycling within the UGA community by offering a program where you can trade in your old clothes for a discount on our clothing line.", "Our target customers are women aged 18-25 who value sustainability and staying on top of the latest fashion trends.", "We understand the importance of social media presence and are committed to showcasing our clothing line through beautiful and modern posts.","Join us in our mission to save the planet one dress at a time. Let's make a difference together.", "We can't wait to see you rocking our sustainable and stylish clothing pieces. Together, let's make a positive impact on the environment while staying on-trend."]
    var facebook = ["apple", "banana", "orange"]
    var twitter = ["apple", "banana", "orange"]
    @Binding var showSheet: Bool
    
    var body: some View {
        
        VStack {
            Text("MY MARKETING STRATEGY")
                .padding(.top,   40)
                
            Text("Insta Captions")
                .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(instagram, id: \.self) { item in
                        GeometryReader { geometry in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("dairyBlue"))
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                Text(item)
                                    .padding(20)
                            }
                        }
                        .frame(height: getHeight(for: item))
                    }
                }
            }
            .frame(width: 350, height: 560)

            Button("Dismiss") {
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
func getHeight(for text: String) -> CGFloat {
    let textHeight = text.height(withConstrainedWidth: UIScreen.main.bounds.width - 20, font: .systemFont(ofSize: 17, weight: .regular))
    
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


