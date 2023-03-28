//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI
struct ProfileView: View {

    var name = "Name"
    var brandName = "Brand Name"
    @State private var showSheet = false
    @Binding var currentView: Int
    

    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
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
//            PopupView(showSheet: $showSheet)
        }
        .frame(width: 350)
    }
}
struct PopupView: View {
    //these arrays below will be populated from the database but this will do for now
    var instagram = ["A carousel post featuring high-quality images of their unique and new milk flavors, showcasing their competitive advantage.", "A before and after post featuring an image of a customer's coffee without their milk, and then another image of their coffee after adding their milk, highlighting the freshest milk aspect of their mission.", "A video post showcasing the process of how their milk is made, emphasizing their commitment to freshness.", "A throwback post featuring a vintage milkman image, tying into their message to bring back the classic milkman and retro style.", "A user-generated content post featuring images and reviews from satisfied customers, fostering a familial vibe with their followers.", "An inspirational quote post with a message about taking a moment to enjoy the simple pleasures in life, featuring an image of their milk product.", "A behind-the-scenes post featuring images of their team working hard to deliver the freshest milk, highlighting their value of speed.", "A post showcasing their involvement in the local community, such as participating in a farmers market or sponsoring a local event, emphasizing their marketing goal to reach their local community.","A creative post featuring their milk product in a unique and unexpected way, such as creating latte art with their milk flavors.", "A poll post asking followers to vote for their favorite unique milk flavor or suggest new flavor ideas, encouraging engagement and interaction with their audience."]
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
    
    return textHeight + 70 // add some padding for the text
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


