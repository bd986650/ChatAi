//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
    
    var name = "Sarah Apple"
    var brandName = "Upcycle Athens"
    @State private var showSheet = false
    @Binding var currentView: Int
    
    //start of db code
    let db = Firestore.firestore()
    func readData() {
        let docRef = db.document("dairymarket/profileInfo")
        docRef.getDocument{ snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            print(data)
        }
    } //readData
    
    func writeData(text: String) {
        let docRef = db.document("dairymarket/profileInfo")
        docRef.setData(["text": text])
    } //writeData
    //end of db code

    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 5)
            HStack(spacing: 20) {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text(name + " / " + brandName)
            }
            .offset(x: -50)
            .fixedSize()
            
            Text("MY PROJECTS")
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
                    Text("BRAND")
                        .frame(height: 30)
                    Text("MARKETING GOALS")
                        .frame(height: 30)
                    Text("CUSTOMER")
                        .frame(height: 30)
                    Text("CREATIVE DIRECTION")
                        .frame(height: 30)
                }
                
                VStack {
                    ForEach((0...3), id: \.self) { i in
                        HStack {
                            Text("view")
                                .font(.system(size: 14))
                                .padding(.vertical, 5)
                                .frame(width: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.blue)
                                )
                            Text("modify")
                                .font(.system(size: 14))
                                .padding(.vertical, 5)
                                .frame(width: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.blue)
                                )
                        }
                        .frame(height: 30)
                    }
                }
            }
            
            Spacer()
            Text("View my marketing strategy")
                .foregroundColor(.blue)
                .onTapGesture {
                    withAnimation {
                        self.showSheet.toggle()
                       
                    }
                }
                .sheet(isPresented: $showSheet) {
                    PopupView(showSheet: $showSheet)
                }
            Spacer()
                .frame(height: 100)
//            PopupView(showSheet: $showSheet)
        }
        .frame(width: 350)
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
                
            Text("Insta Inspo")
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
            .foregroundColor(Color("dairyBlue"))
            
            Spacer()
        }
        .frame(height: 960)
        .frame(width: UIScreen.main.bounds.width)
        .background(.gray)
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
    static var previews: some View {
        ProfileView(currentView: .constant(0))
    }
}


